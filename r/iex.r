library(httr)
library(jsonlite)
library(stringr)
library(data.table)
library(dplyr)
library(ggvis)

FUND_DETAIL_URL <- 'http://www.iex.nl/Ajax/ChartData/interday.ashx'
FUND_LIST_URL     <- 'http://www.iex.nl/Koersen/Beleggingsfondsen.aspx'


load_fund_urls <- function() {
    print(paste("Loading funds"));
    return(str_extract_all(GET(FUND_LIST_URL),'Beleggingsfonds-Koers\\/\\d+\\/(\\w|\\-)+\\.aspx'))
}

get_funds <- function() {
    ids <- c()
    titles <- c()
    urls <- load_fund_urls()
    
    extract_title <- function(url) {
      title <- str_extract(url,'\\D+\\.aspx$')
      return(substr(title,2,nchar(title)-5))
    }
    
    extract_id <- function(url) {
      return (as.numeric(str_extract(url, '\\d+')))
    }
    
    for(url in urls) {
      ids <- append(ids, extract_id(url))
      titles <- append(titles, extract_title(url))
    }
    #return(data.table(id=ids[1:100], title=titles[1:100],key=c('id')))
    return(data.table(id=ids, title=titles,key=c('id')))
}

get_all_fund_data <-function (funds) {
    dates  <- c()
    prices <- c()
    ids    <- c()
    years  <- c()
    
    for (fund_id in funds$id) {
      fund <- funds[id==fund_id]

      print(paste("Loading funddata:",fund_id))
      print(paste0(FUND_DETAIL_URL,"?id=",fund_id))
      response <- GET(FUND_DETAIL_URL, query=list(id=fund_id))
      
      json   <- content(response, 'text')
      json   <- sub('^ChartData\\(','', json) 
      json   <- sub('\\);$','', json) 
      
      json_data <- fromJSON(json)
      fund_data <- json_data$HistoricalData
      
      for(i in 1:nrow(fund_data)) {
        date <- as.POSIXct(fund_data[i,1] / 1000, origin='1970-01-01')
        price  <- fund_data[i,2]

        dates  <- append(dates, date)
        year   <- as.numeric(format(date, '%Y'))
        prices <- append(prices, price)
        ids    <- append(ids, fund_id)
        years  <- append(years, year)
      }
    }
    n = length(prices)
    print(paste("Rows:",n))
    cc_return = log(prices[2:n]) - log(prices[1:n-1])
    
    
    return(data.table(
      id=ids, 
      date=dates, 
      price=prices, 
      cc_return=append(c(0), cc_return),
      year=years))
}

f <- get_funds()
lookup <- function(my_id) { 
    return(f[my_id %in% id,]$title)
}


data <- get_all_fund_data(get_funds())
#table

rounded <- function(v){ return(round(v*100)/100.0)}

performance <- function(start,end){ 
    return(rounded(100.0 * (end-start)/start))
}

plot_cc_return <- function(data,fund_id, fund_year=2015){
    data[year==fund_year & id==fund_id] %>% ggvis(~date, ~cc_return) %>% layer_lines()
}

plot_price <- function(data,fund_id, fund_year=2015){
    data[year==fund_year & id==fund_id] %>% ggvis(~date, ~price) %>% layer_lines()
}

plot_perc <- function(data,fund_id, fund_year=2015){
    data[year==fund_year & id==fund_id] %>% mutate( perc=100* (price-first(price))/price )%>% ggvis(~date, ~perc) %>% layer_lines()
}

# earnings
get_earnings <- function(my_year) {
    return(
      data[year==my_year]   %>% 
        arrange(date)       %>%
        group_by(id)        %>% 
        summarise(start=first(price), n=n(),mid=nth(price,n() / 2), qrt=nth(price,n() / 4), end=last(price),
              var=rounded(100 * quantile(cc_return,c(0.05))),
              sd=rounded(100 * (exp(sd(cc_return))-1)),
              mean_cc=rounded(100 * (exp(mean(cc_return)*n()) -1) ) 
            ) %>% 
        mutate( title=lookup(id), 
            perf_yr=performance(start,end), 
            perf_mid=performance(start,mid), 
            perf_3months=performance(start,qrt)) %>%
        arrange(desc(perf_yr)) %>% 
        select(title,perf_yr, perf_mid, perf_3months, var, sd, id)
    )
}

for(i in 2010:2015) {
    d <- get_earnings(i)
    p = nrow(d[perf_yr>0])/nrow(d)
    print(paste('Year:',i, 'ratio:', rounded(p)))
}

get_overview_fund <- function(id){
    d_specific <- data[id==17149] %>% 
      group_by(year) %>% 
      summarise(start=first(price), n=n(),mid=nth(price,130), qrt=nth(price,65), end=last(price),
                var=rounded(100 * quantile(cc_return,c(0.05))),
                sd=rounded(100 * (exp(sd(cc_return))-1)),
                mean_cc=rounded(100 * (exp(mean(cc_return)*n()) -1) ) 
      ) %>% 
      mutate( 
              perf_yr=performance(start,end), 
              perf_mid=performance(start,mid), 
              perf_3months=performance(start,qrt)) 
    return(d_specific)
}
# Volatility
data[id==12025] %>% compute_bin(~cc_return, width=0.01) %>% ggvis(~x_, ~count_) %>% layer_bars() 
data[year==2015, id==12025] %>% ggvis(~date, ~price) %>% layer_lines()

# rendement 1/3/6 maand 1/3/5 jaar / koers / type[stocks/bonds/50-50] / themes
#fund_data <- get_all_fund_data(c(339766))

#fund_data[,lapply(.SD, mean), by=.(year=format(date,'%Y')), .SDcols=c('price')]
#fund_data[,.(probs=quantile(annual$cc_return, probs = c(0.01,0.05,0.25, 0.5, 0.75)) * 365)]
#for(i in 2010:2015) {
#    annual <- fund_data[year==i,]
#    print("")
#    print(paste("Year:",i))
#    print(quantile(annual$cc_return, probs = c(0.01,0.05)))
#    print(meanfunds(aennual$cc_return) * 365)
#    
#}


