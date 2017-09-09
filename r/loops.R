cities <- c('Amsterdam','Den Haag','Eindhoven');

for(city in cities){
  print(paste('City: ', city));
}# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for( data in nyc) {
  print(data);
}



# Loop version 2
for(i in length(nyc) {
  print(nyc[[i]])
}