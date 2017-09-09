


# Section 4 - Chaining
# Chaining, the basics
# The data.table package has already been loaded

# Build DT
set.seed(1L)
DT <- data.table(A = rep(letters[2:1], each = 4L), B = rep(1:4, each = 2L), C = sample(8))

# Use chaining:
# Cumsum of C while grouping by A and B, and then select last two values of C while grouping by A
DT[,.(C=cumsum(C)),by=.(A,B)][,.(C=tail(C,n=2)),by=A]


# Chaining your iris dataset
# The data.table DT is loaded in your workspace

# Perform chained operations on DT
DT[,.(
Sepal.Length=median(Sepal.Length),
Sepal.Width=median(Sepal.Width),
Petal.Length=median(Petal.Length),
Petal.Width=median(Petal.Width)),
by=Species][order(-Species)]


#Section 5 - Subset of Data


# Programming time vs readability
# Print out the pre-loaded data.table DT
DT

# Mean of columns
DT[, lapply(.SD, mean), by=x]


# Median of columns
DT[, lapply(.SD, median), by=x]





# Introducing .SDcols
# Print out the new data.table DT
DT

# Calculate the sum of the Q columns
DT[,lapply(.SD, sum), .SDcols=2:4]

# Calculate the sum of columns H1 and H2
DT[,lapply(.SD, sum), .SDcols=paste0('H',1:2)]

# Select all but the first row of groups 1 and 2, returning only the grp column and the Q columns.
DT[,tail(.SD, n=-1),by=grp, .SDcols=paste0('Q',1:3)]



#Mixing it together: lapply, .SD, SDcols and .N
# DT is pre-loaded

# Sum of all columns and the number of rows
DT[,c(lapply(.SD, sum), .N), by=x, .SDcols=c('x','y','z')]

# Cumulative sum of column x and y while grouping by x and z > 8
DT[,lapply(.SD,cumsum), by=.(by1=x, by2=z>8),.SDcols=c('x','y')]

# Chaining
DT[,lapply(.SD,cumsum), by=.(by1=x, by2=z>8),.SDcols=c('x','y')][,lapply(.SD,max), by=by1,.SDcols=c('x','y') ]




#Adding, updating and removing columns
# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add column by reference: Total
DT[,Total := sum(B), by=A]

# Add 1 to column B
DT[c(2,4), B := (B+1L)]

# Add a new column Total2
DT[2:4, Total2 := sum(B), by=A]


# Remove the Total column
DT[, Total:= NULL]

# Select the third column using `[[`
DT[[3]]



# A data.table DT has been created for you
DT <- data.table(A = c(1, 1, 1, 2, 2), B = 1:5)

# Update B, add C and D
DT[,  `:=` (
    B=B+1L,
    C=A + B,
    D=2)]

# Delete my_cols
my_cols <- c("B", "C")
DT[ ,(my_cols) := NULL]

# Delete column 2 by number
DT[ , (2) := NULL]



#Using set
# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add column by reference: Total
DT[,Total := sum(B), by=A]

# Add 1 to column B
DT[c(2,4), B := (B+1L)]

# Add a new column Total2
DT[2:4, Total2 := sum(B), by=A]


# Remove the Total column
DT[, Total:= NULL]

# Select the third column using `[[`
DT[[3]]




# A data.table DT has been created for you
DT <- data.table(A = c(1, 1, 1, 2, 2), B = 1:5)

# Update B, add C and D
DT[,  `:=` (
    B=B+1L,
    C=A + B,
    D=2)]

# Delete my_cols
my_cols <- c("B", "C")
DT[ ,(my_cols) := NULL]

# Delete column 2 by number
DT[ , (2) := NULL]

#Using set
# Set the seed
set.seed(1)

# Check the DT that is made available to you
# Define DT
DT <- data.table(a = letters[c(1, 1, 1, 2, 2)], b = 1)

# Add a postfix "_2" to all column names
setnames(DT, paste0(colnames(DT),'_2'))

# Change column name "a_2" to "A2"
setnames(DT, 'a_2','A2')


# Reverse the order of the columns
setcolorder(DT, rev(colnames(DT)))


# The data.table package is pre-loaded

# Convert iris to a data.table

iris <- data.table(iris)

# Species is "virginica"
iris[Species=="virginica"]

# Species is either "virginica" or "versicolor"
iris[Species %in% c("virginica","versicolor")]


# iris as a data.table
iris <- as.data.table(iris)

# Remove the "Sepal." prefix
setnames(iris, gsub("^Sepal.","", names(iris)))

# Remove the two columns starting with "Petal"
iris[,grep("^Petal",names(iris)) := NULL]


# Cleaned up iris data.table
iris

# Rows for which area is greater than 20 sq cm
iris[Length*Width > 20]

# Add new boolean column is_large (area greater than 25 sq cm)
iris[, is_large := Length*Width > 25 ]

# Now select rows again where the area is greater than 25 square centimeters
iris[is_large == TRUE]




# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9,8 ,8, 6),
                 C = 6:12)
setkey(DT,A,B)

# Select the "b" group
DT["b"]

# "b" and "c" groups
DT[c("b", "c")]

# The first row of the "b" and "c" groups
DT[c("b", "c"), mult = "first"]

# First and last row of the "b" and "c" groups
DT[c("b", "c"), .SD[c(1, .N)], by = .EACHI]

# Copy and extend code for instruction 4: add printout
DT[c("b", "c"), { print(.SD); .SD[c(1, .N)] }, by = .EACHI]


# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9, 8, 8, 6),
                 C = 6:12,
                 key= "A,B")

# Get the key of DT
key(DT)

# Row where A == "b" & B == 6
DT[.('b',6)]

# Return the prevailing row
DT[.('b',6),roll=-Inf]

# Return the nearest row
DT[.('b',6),roll='nearest']


# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9, 8, 8, 6),
                 C = 6:12,
                 key= "A,B")

# Look at the sequence (-2):10 for the "b" group
DT[.("b", (-2):10)]

# Add code: carry the prevailing values forwards
DT[.("b", (-2):10), roll = TRUE]

# Add code: carry the first observation backwards
DT[.("b", (-2):10), roll = TRUE, rollends = TRUE]
DT[.("b", (-2):10), roll = TRUE, rollends = c(TRUE, TRUE)] # also OK
