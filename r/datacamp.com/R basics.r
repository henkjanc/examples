# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 *14 != 17 - 101

# Comparison of character strings
"useR" == "user"


# Compare a logical with a numeric

TRUE == 1

# Comparison of numerics
- 6 * 5 + 2 >= -10 + 1

# Comparison of character strings
"raining" <= "raining dogs"

# Comparison of logicals
TRUE > FALSE



# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <=5


# LinkedIn more popular than Facebook
linkedin > facebook


# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)
rownames( views ) <- c('linkedin','facebook')
colnames( views ) <- 1:7

# When does views equal 13?
views ==13
# When is views less than or equal to 14?
views <= 14

# How often does facebook equal or exceed linkedin times two?
sum(facebook >= 2 * linkedin )



#LOGICAL OPERATORS
# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <=20

# Is last between 0 and 5 or between 10 and 15?
last > 0 & last < 5 | last > 10 & last < 15



# The social data (linkedin, facebook, views) has been created for you

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12


#CONDITIONAL STATEMENTS
# Variables related to your last day of recordings
medium <- "twitter"
num_views <- 17

# Examine the if statement for medium
if(medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views
if(num_views>15) {
  print("You're popular!" )
}


# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if(medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if(num_views > 15) {
  print("You're popular!")
} else {
print("Try to be more visible!")
}


# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if(medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if(medium == "Facebook") {
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if(num_views > 15) {
  print("You're popular!")
} else if(num_views > 10 & num_views < 15) {
  print("Your number of views is average")
} else{
  print("Try to be more visible!")
}



# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if ( li >= 15 & fb >= 15) {
  sms <- 2 * ( li + fb)
} else if ( li < 10 & fb < 10) {
  sms <- 0.5 * ( li + fb)
} else {
  sms <- fb + li
}
# Print the resulting sms to the console
print(sms)


#LOOPS

# Initialize the speed variable
speed <- 64

# Code the while loop
while( speed > 30 ) {
  print ("Slow down!");
  speed <- speed - 7;
}

# Print out the speed variable
print(speed);



# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while(speed > 30) {
  print(paste("Your speed is ",speed))
  if (speed > 48) {
    print("Slow down big time!")
      speed <- speed - 11

  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}




# Initialize the speed variable
speed <- 88

while(speed > 30) {
  print(paste("Your speed is",speed))
  
  # Break the while loop when speed exceeds 80
  if ( speed > 80) {
    break;
  }
  
  if(speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}


# Initialize i

i <- 0;
# Code the while loop
while (i <= 10) {
  i <- i + 1;
  
  print( i * 3);
  if ( (i * 3) %% 8 == 0 ) {
     break;
  }
}


# FOR LOOPS

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for(views in linkedin) {
   print(views)
}

# Loop version 2
for(i in 1:length(linkedin)) {
  print(linkedin[i])
}

# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for( data in nyc) {
  print(data)
}



# Loop version 2
for(i in 1:length(nyc)) {
  print(nyc[[i]])
}


# The tic-tac-toe matrix has already been defined for you
ttt <- matrix(c("O", NA, "X", "NA", "O", NA, "X", "O", "X"), nrow = 3, ncol = 3)

# define the double for loop
for(i in 1:nrow(ttt)) {
  for(j in 1:ncol(ttt)) {
    x <- ttt[i,j]
    print(paste("On row ",i," and column ",j," the board contains ",x))
  }
}


# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals

for(l in linkedin) {
   if (l > 10) print("You're popular!")
   else
   if (l < 10) print("Be more visible!")
   print(l)
}


# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for(li in linkedin) {
  if(li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add code to conditionally break iteration
  if (li> 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }

  # Add code to conditionally skip iteration
  if (li < 5) {
    print("This is too embarassing...")
    next
  }

  print(li)
}



# Pre-defined variables
rquote <- "R's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Your solution here
rcount = 0
for(char in chars) {
  if (toupper(char) == 'R') rcount <- rcount + 1
  if (toupper(char) == 'U') break
}

# Print the resulting rcount variable to the console
print(rcount)


#Introduction to Functions

# Consult the documentation on the mean() function
?mean

# Inspect the arguments of the mean() function
args(mean)



# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb <- mean(x = facebook)


# Inspect avg_li and avg_fb
avg_li
avg_fb




# Calculate the mean of linkedin minus facebook
mean(linkedin - facebook)


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
s_sum <- linkedin+facebook
avg_sum <- mean(s_sum)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(s_sum,trim=0.2)


# Inspect both new variables
avg_sum
avg_sum_trimmed


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of facebook
mean(facebook, na.rm=TRUE)


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm = TRUE)



# Create a function pow_two()

pow_two <- function(x) {
  x * x
}
# Use the function 

pow_two(12)
# Create a function sum_abs()
sum_abs <-function(a,b) {
  abs(a) + abs(b)
}

# Use the function
sum_abs(-2,3)




# Define the function hello()
hello <- function() {
  print ("Hi there!")
  return(TRUE)
}

# Call the function hello()
hello()

# Define the function my_filter()
my_filter <- function(v) {
  if (v>=0) {
    return(v) 
  }
  else {
    return(NULL)
  }
}


# Call the function my_filter() twice
my_filter(5)
my_filter(-5)



# Extend the pow_two() function
pow_two <- function(x,print_info=TRUE) {
  if (print_info) {
     print (paste(x,"to the power two equals",  x^2))
  }
  x^2
}
pow_two(3)

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <= 14



# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14);
facebook <- c(17, 7, 5, 16, 8, 13, 14);

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if(num_views > 15) {
    print("You're popular!");
    return(num_views);
  } else {
    print("Try to be more visible!");
    return(0)
  }
}

# Define the interpret_all() function
interpret_all <- function(data, return_sum = TRUE) {
   score <- 0
   for(i in data) { 
      score <- score + interpret(i);
   }

   if (return_sum) {
      return(score)
   }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin);
interpret_all(facebook);



#LOAD R PACKAGES
# The mtcars vectors have already been prepared for you
wt <- mtcars$wt
hp <- mtcars$hp

# Request the currently attached packages
search()

# Try the qplot() function with wt and hp
qplot(wt, hp)

# Load the ggplot2 package
library('ggplot2')

# Retry the qplot() function
qplot(wt, hp)


# Check out the currently attached packages again
search()



# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year: split_math

split_math <- strsplit(pioneers, ':')

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)



# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(v) {
   return(v[1])
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)
names
# Write function select_second()
select_second <- function(v) {
   return(v[2])
}


# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
years



# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)



names <- lapply(split_low, function(x) { x[1]})


years <- lapply(split_low, function(x) { x[2]})
names
years



# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Replace the select_*() functions by a single function: select_el
select_el <- function(x,index) { 
  x[index] 
}




# Call the select_el() function twice on split_low: names and years
names <- lapply( split_low, select_el, index = 1)
years <- lapply( split_low, select_el, index = 2)

names
years


# temp has already been defined in the workspace

# Use lapply() to find each day's minimum temperature

lapply(temp,min)
# Use sapply() to find each day's minimum temperature

sapply(temp,min)

# Use lapply() to find each day's maximum temperature


lapply(temp,max)
# Use sapply() to find each day's maximum temperature

sapply(temp,max)


# temp is already defined in the workspace

# Define a function calculates the average of the min and max of a vector: extremes_avg


extremes_avg <- function(v) {
   return(mean(c( min(v),max(v) )));
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)


# temp is already defined in the workspace

# Define a function calculates the average of the min and max of a vector: extremes_avg


extremes <- function(v) {
   v <- c( min(v),max(v) )
   names( v ) <- c("min","max")
   return(v)
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes)
x


# temp is already prepared for you in the workspace

# Create a function that returns all values below zero: below_zero



below_zero <- function(v) {
   return( v[v<0])
 }
 
# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply( temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply( temp, below_zero)


# Compare freezing_s to freezing_l using identical()
identical( freezing_s, freezing_l)




# temp is already available in the workspace

# Write a function that 'cat()s' out the average temperatures: print_info
print_info <- function(x) {
   cat("The average temperature is", mean(x), "\n")
}


# Apply print_info() over temp using lapply()

lapply( temp, print_info)



# temp is already available in the workspace

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))


# temp is already defined in the workspace

# Convert to vapply() expression
vapply(temp, max, numeric(1))

# Convert to vapply() expression
vapply(temp, function(x, y) { mean(x) > y }, logical(1), y = 5)

# Definition of get_info (don't change)
get_info = function(x, y) { 
  if(mean(x) > y) {
    return("Not too cold!")
  } else {
    return("Pretty cold!")
  }
}

# Convert to vapply() expression
vapply(temp, get_info, character(1),  y = 5)


# work_todos and fun_todos have already been defined
work_todos <- c("Schedule call with team", 
                "Fix error in Recommendation System", 
                "Respond to Marc from IT")
fun_todos <- c("Sleep", "Make arrangements for summer trip")

# Create a list: todos
todos <- list( work_todos, fun_todos)

# Sort the vectors inside todos alphabetically

lapply(todos, sort)


UTILITIES
# The errors vector has already been defined for you
errors <- c(1.9,-2.6,4.0,-9.5,-3.4,7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

# Don't edit these two lines
vec1 <- c(1.5,2.5,8.4,3.7,6.3)
vec2 <- rev(vec1)

# Fix the error
mean(abs(append(vec1,vec2)))




# The linkedin and facebook vectors have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <-as.vector(unlist(linkedin))
fb_vec <- as.vector(unlist(facebook))


# Append fb_vec to li_vec: social_vec
social_vec <- append( li_vec, fb_vec )

# Sort social_vec
sort( social_vec, decreasing = TRUE)




# Fix me
round(sum(unlist(list(1.1,3,5))))

# Fix me
rep(seq(1, 7, by = 2), times = 7)




REGULAR EXPRESSIONS
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", 
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grep() to match for .edu addresses more robustly
grep('@.*\\.edu$', emails)

# Use grepl() to match for .edu addresses more robustly, save result to hits
hits <- grepl('@.*\\.edu$', emails)


# Subset emails using hits

emails[hits]


#DATES
# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-3-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d" )
date3 <- as.Date(str3, format = "%d/%B/%Y" )



# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")

# Convert times to formatted strings
format( time1, "%M")
format( time2, "%I:%M %p")


# day1, day2, day3, day4 and day5 are already available in the workspace
# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c( day1,day2,day3,day4,day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff( pizza)

# Average period between two consecutive pizza days
print(mean(day_diff))

# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online

time_online <- logout - login

# Inspect the variable time_online
print(time_online)

# Calculate the total time online
print(sum(time_online))

# Calculate the average time online
print(mean(time_online))

