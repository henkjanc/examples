# The dplyr package has already been installed using the command
# install.packages("dplyr")
# Load the dplyr package
library("dplyr")

# The hflights package has already been installed using the command install.packages("hflights")
# Load the hflights package
library("hflights")

# Get a first look at the data (3 options)
summary(hflights)



# Both the dplyr and hflights packages are loaded

# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)

# Display the hflights tbl
hflights

# Create the object carriers, containing only the UniqueCarrier variable of hflights
carriers <- hflights$UniqueCarrier



# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Use lut to translate the UniqueCarrier column of hflights
hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]

# Inspect the resulting raw values of your variables
glimpse(hflights)


# The hflights tbl you built in the previous exercise is available in the workspace.

# Build the lookup table
lut <- c( "A" = "carrier","B" = "weather","C" = "FFA", "D" = "security", "E" = "not cancelled")

# Use the lookup table to create a vector of code labels. Assign the vector to the CancellationCode column of hflights

hflights$CancellationCode <- lut[hflights$CancellationCode ]


# Inspect the resulting raw values of your variables
glimpse(hflights)


# hflights is pre-loaded as a tbl, together with the necessary libraries.

# Return a copy of hflights that contains the four columns related to delay.
select(hflights, ActualElapsedTime, AirTime, ArrDelay , DepDelay)

# print hflights, nothing has changed!
print(hflights)

# Return a copy of hflights containing the columns Origin up to Cancelled
select(hflights, Origin:Cancelled)


# Answer to last question: be concise!
select(hflights, Year:DayOfWeek, ArrDelay:Diverted)




# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Return a tbl containing just ArrDelay and DepDelay
select( hflights, ends_with("Delay"))

# Return a tbl as described in the second exercise, using both helper functions and variable names
select( hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancel"))

# Return a tbl as described in the third exercise, using only helper functions.
select( hflights, ends_with("Time"), ends_with("Delay"))



# both hflights and dplyr are available

# Exercise 1
ex1r <- hflights[c("TaxiIn","TaxiOut","Distance")]
ex1d <- select( hflights,TaxiIn,TaxiOut,Distance)

# Exercise 2
ex2r <- hflights[c("Year","Month","DayOfWeek","DepTime","ArrTime")]
ex2d <- select( hflights,Year:ArrTime, -DayofMonth)

# Exercise 3
ex3r <- hflights[c("TailNum","TaxiIn","TaxiOut")]
ex3d <- select( hflights, starts_with("T"))


# hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate( hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to a copy of g1 and save the result as g2.
g2 <- mutate( g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to a copy of g2 and save the result as g3.
g3 <- mutate( g2, AverageSpeed = Distance / AirTime * 60)

# hflights and dplyr are ready, are you?

# Add a second variable loss_percent to the dataset and save the result to m1.
m1 <- mutate(hflights, loss = ArrDelay - DepDelay,loss_percent = (ArrDelay - DepDelay) / DepDelay * 100)

# Remove the redundancy from your previous exercise and reuse loss to define the loss_percent variable.
# Assign the result to m2
m2 <- mutate(m1, loss = ArrDelay - DepDelay, loss_percent = loss / DepDelay * 100)

# Add the three variables as described in the third exercise and save the result to m3
m3 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut,ActualGroundTime=ActualElapsedTime-AirTime, Diff=TotalTaxi-ActualGroundTime )


# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more.
f1 <- filter( hflights, Distance >= 3000)

# All flights flown by one of JetBlue, Southwest, or Delta airlines
f2 <- filter( hflights, UniqueCarrier %in% c('JetBlue','Southwest','Delta'))

# All flights where taxiing took longer than flying
f3 <- filter( hflights, TaxiIn + TaxiOut > AirTime)


# hflights is at your service as a tbl!

# all flights that departed before 5am or arrived after 10pm.
f1 <- filter( hflights, DepTime < 0500 | ArrTime > 2200)

# all flights that departed late but arrived ahead of schedule
f2 <-  filter( hflights, DepDelay > 0, ArrDelay < 0)

# all cancelled weekend flights
f3 <- filter( hflights, Cancelled ==1, DayOfWeek %in% c(6,7))


# all flights that were cancelled after being delayed
f4 <- filter( hflights, Cancelled ==1, DepDelay > 0)


# hflights is already available in the workspace

# Select the flights that had JFK as their destination
c1 <- filter( hflights, Dest == 'JFK')

# Combine the Year, Month and DayofMonth variables to create a Date column
c2 <- mutate(c1, Date=as.Date(paste(Year,Month,DayofMonth,sep="-")) )

# Retain only a subset of columns to provide an overview
c3 <- select( c2, Date, DepTime, ArrTime, TailNum)
c3

# dplyr and the hflights tbl are available
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
a1 <- arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
a2 <- arrange(dtc, CancellationCode)

# Arrange according to carrier and departure delays
a3 <- arrange(hflights, UniqueCarrier,  DepDelay)


# dplyr and the hflights tbl are available

# Arrange according to carrier and decreasing departure delays
a1 <- arrange(hflights, UniqueCarrier, desc( DepDelay))

# Arrange flights by total delay (normal order).
a2 <- arrange( hflights, DepDelay + ArrDelay)

# Keep flights leaving to DFW before 8am and arrange according to decreasing AirTime
a3 <- arrange( filter(hflights, DepTime < 800, Dest=='DFW'), desc( AirTime))


# hflights and dplyr are loaded in the workspace

# Determine the shortest and longest distance flown and save statistics to min_dist and max_dist resp.
s1 <- summarize(hflights, min_dist = min(Distance), max_dist=max(Distance))

# Determine the longest distance for diverted flights, save statistic to max_div. Use a one-liner!
s2 <- summarize(filter(hflights,Diverted==1), max_div=max(Distance))


# hflights is available

# Calculate summarizing statistics for flights that have an ArrDelay that is not NA
temp1 <- filter(hflights,!is.na(ArrDelay))
s1 <- summarize(temp1, earliest=min(ArrDelay), average=mean(ArrDelay), latest=max(ArrDelay), sd=sd(ArrDelay))

# Calculate the maximum taxiing difference for flights that have taxi data available
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))
s2 <- summarize( temp2, max_taxi_diff = max( abs(TaxiIn - TaxiOut)))
s1
s2


# hflights is available with full names for the carriers

# Calculate the summarizing statistics of hflights
s1 <- summarize( hflights, n_obs = n(), n_carrier=n_distinct(UniqueCarrier), n_dest=n_distinct(Dest), dest100=nth(Dest,100))

# Calculate the summarizing statistics for flights flown by American Airlines (carrier code "American")
aa <- filter( hflights, UniqueCarrier == "American")
s2 <- summarize(aa, n_flights = n(), n_canc = sum(Cancelled==1), p_canc= n_canc / n_flights * 100.0, avg_delay=mean(ArrDelay, na.rm = TRUE))


# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
p <- hflights %>% mutate(diff=TaxiOut - TaxiIn) %>% filter(!is.na(diff)) %>% summarize(avg=mean(diff))



# Part 1, concerning the selection and creation of columns
d <- hflights %>% select(Dest,UniqueCarrier,Distance,ActualElapsedTime) %>% mutate(RealTime=ActualElapsedTime + 100, mph=Distance/RealTime*60.0)

# Part 2, concerning flights that had an actual average speed of less then 70 mph.
d %>% filter(!is.na(mph), mph < 70) %>% summarize(n_less =n(), n_dest=n_distinct(Dest), min_dist=min(Distance), max_dist=max(Distance) )


# hflights and dplyr are loaded and ready to roll

# Solve the exercise using a combination of dplyr verbs and %>%
# Part 1, concerning the selection and creation of columns
d <- hflights %>%
select(Dest,Distance,ActualElapsedTime, Cancelled, Diverted) %>%
mutate(RealTime=ActualElapsedTime + 100, mph=Distance/RealTime*60.0) %>%
filter( mph  < 105 |Cancelled==1 | Diverted == 1) %>%
summarize(n_non =n(), p_non=n()/nrow(hflights) * 100, n_dest=n_distinct(Dest), min_dist=min(Distance),max_dist=max(Distance) )


# hflights and dplyr are loaded

# Count the number of overnight flights
hflights %>%
filter(ArrTime < DepTime ) %>%
summarize(n=n())


# hflights is in the workspace as a tbl, with translated carrier names

# Make the calculations to end up with ordered statistics per carrier
hflights %>%
   group_by(UniqueCarrier) %>%
   summarise(n_flights = n(), n_canc = sum(Cancelled == 1), p_canc = mean(Cancelled == 1) * 100, avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
   arrange(avg_delay, p_canc)


# Answer the question: At which day of the week is total taxiing time highest?
hflights %>%
   group_by(DayOfWeek) %>% summarise(avg_taxi = mean(TaxiIn + TaxiOut, na.rm=TRUE)) %>% arrange(desc(avg_taxi))
# hflights is in the workspace as a tbl, with translated carrier names

# Make the calculations to end up with ordered statistics per carrier
# Answer the question: Which day of the week is average total taxiing time highest?

# hflights is in the workspace as a tbl, with translated carrier names

# Make the calculations to end up with ordered statistics per carrier
hflights %>%
   group_by(UniqueCarrier) %>%
   summarise(n_flights = n(), n_canc = sum(Cancelled == 1), p_canc = mean(Cancelled == 1) * 100, avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
   arrange(avg_delay, p_canc)


# Answer the question: At which day of the week is total taxiing time highest?
hflights %>%
   group_by(DayOfWeek) %>% summarise(avg_taxi = mean(TaxiIn + TaxiOut, na.rm=TRUE)) %>% arrange(desc(avg_taxi))
# hflights is in the workspace as a tbl, with translated carrier names

# Make the calculations to end up with ordered statistics per carrier
# Answer the question: Which day of the week is average total taxiing time highest?


# dplyr is loaded, hflights is loaded with fancy carrier names

# Solution to first instruction

hflights %>%
   filter(!is.na(ArrDelay)) %>%
   group_by(UniqueCarrier) %>%
   summarise(
         p_delay =  sum(ArrDelay > 0) / n()   ) %>%
    mutate( rank=rank(p_delay)) %>%
    arrange(rank)


# Solution to second instruction
hflights %>%
   filter(!is.na(ArrDelay), ArrDelay > 0) %>%
   group_by(UniqueCarrier) %>%
   summarise(avg = mean( ArrDelay, na.rm = TRUE   )) %>%
    mutate( rank=rank(avg)) %>%
    arrange(rank)



    # dplyr and hflights (with translated carrier names) are pre-loaded

    # Which plane (by tail number) flew out of Houston the most times? How many times? adv1
    adv1 <- hflights %>%
      group_by(TailNum) %>%
      summarize(n=n()) %>%
      filter(n==max(n))
    # How many airplanes only flew to one destination from Houston? adv2

    adv2 <- hflights %>%
      group_by(TailNum) %>%
      summarize( n=n_distinct(Dest)) %>%
      filter(n==1) %>%
      summarize(nplanes=n())

    # Find the most visited destination for each carrier: adv3
    adv3 <- hflights %>%
      group_by(UniqueCarrier, Dest) %>%
      summarize( n=n()) %>%
      mutate(rank=rank(desc(n))) %>%
      filter(rank==1)
    adv3

    # Find the carrier that travels to each destination the most: adv4
    adv4 <- hflights %>%
      group_by(Dest,UniqueCarrier) %>%
      summarize( n=n()) %>%
      mutate(rank=rank(desc(n))) %>%
      filter(rank==1)



      # hflights2 is pre-loaded as a data.table

      # Use summarise to calculate n_carrier
      s2 <- hflights2 %>% summarise( n_carrier=n_distinct(UniqueCarrier))
      s2

      # set up a src that connects to the mysql database (src_mysql is provided by dplyr)
my_db <- src_mysql(dbname = "dplyr",
                  host = "dplyr.csrrinzqubik.us-east-1.rds.amazonaws.com",
                  port = 3306, user = "dplyr", password = "dplyr")
# and reference a table within that src
nycflights <- tbl(my_db, "dplyr")
# nycflights is now available as an R object that references to the remote nycflights table.

# glimpse at nycflights
glimpse(nycflights)

# Calculate the grouped summaries detailed in the instructions.
dbsumm <- nycflights %>% group_by( carrier) %>% summarise( n_flights=n(), avg_delay=mean(arr_delay)) %>% arrange(avg_delay)
