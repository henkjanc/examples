cars <- read.csv("~/examples/python/occaciondata/cars.csv")

c <- cars[cars$year == 2012,]
# The dplyr package has already been installed using the command 
# install.packages("dplyr")
# Load the dplyr package
install.packages("dplyr")


# The hflights package has already been installed using the command install.packages("hflights")
# Load the hflights package

#install.packages("hflights")
# Get a first look at the data (3 options)

summary(hflights)
install.packages('ggplot2')
qplot(c$kms, c$price)