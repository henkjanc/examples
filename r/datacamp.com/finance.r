# Assign the URL to the CSV file
data_url = "http://faculty.washington.edu/ezivot/econ424/sbuxPrices.csv"
# Load the data frame using read.csv
sbux_df = read.csv(data_url, header = TRUE, stringsAsFactors = FALSE)
# sbux_df should be a data frame object. Data frames are rectangular data objects that typically contain
# observations in rows and variables in columns


# The sbux_df data frame is already loaded in your work space
str( sbux_df )
head( sbux_df)
tail( sbux_df )
class(sbux_df$Date)


# The sbux_df data frame is already loaded in your work space
closing_prices = sbux_df[,"Adj.Close", drop=FALSE]


# The sbux_df data frame is already loaded in your work space

# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 =  which(sbux_df$Date == "3/1/1994")
index_2 =  which(sbux_df$Date == "3/1/1995")
# Extract prices between 3/1/1994 and 3/1/1995
some_prices = sbux_df[index_1:index_2,"Adj.Close"]


# The sbux_df data frame is already loaded in your work space

# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]
rownames(sbux_prices_df) = sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 = sbux_prices_df["3/1/1994",1]
price_2 = sbux_prices_df["3/1/1995",1]


# Now add all relevant arguments to the plot function below to get a nicer plot
plot(sbux_df$Adj.Close,type="l", col="blue", lwd=2, ylab="Adjusted close", main="Monthly closing price of SBUX")


# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods
n = nrow(sbux_prices_df)
sbux_ret = (sbux_prices_df[2:n,1] - sbux_prices_df[1:(n-1),1]) / sbux_prices_df[1:(n-1),1]

# Notice that sbux_ret is not a data frame object
class(sbux_ret)


# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# Now add dates as names to the vector and print the first elements of sbux_ret to the console to check
names(sbux_ret) = sbux_df[2:n,"Date"]

head(sbux_ret)


# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret = log(sbux_prices_df[2:n, 1]) - log(sbux_prices_df[1:(n-1), 1]) 
# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) = sbux_df[2:n,"Date"]
# Show sbux_ccret
head(sbux_ccret)


# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret = log(sbux_prices_df[2:n,1]) - log(sbux_prices_df[1:(n-1),1])
names(sbux_ccret) = sbux_df[2:n,1]
head(sbux_ccret)

# Compare the simple and cc returns
head(cbind(sbux_ret,sbux_ccret))


# The simple returns (sbux_ret) and the continuously compounded returns (sbux_ccret) have been preloaded in your workspace

# Plot the returns on the same graph
plot(sbux_ret, type="l", col="blue", lwd=2, ylab="Return",
               main="Monthly Returns on SBUX")

# Add horizontal line at zero
abline(h=0)

# Add a legend
legend(x="bottomright", legend=c("Simple", "CC"), 
       lty=1, lwd=2, col=c("blue","red"))

# Add the continuously compounded returns
lines(sbux_ccret, col="red", lwd=2)

# The simple returns (sbux_ret) and the continuously compounded returns (sbux_ccret) have been preloaded in your workspace

# Compute gross returns
sbux_gret = sbux_ret + 1

# Compute future values
sbux_fv = cumprod( sbux_gret )

# Plot the evolution of the $1 invested in SBUX as a function of time
plot(sbux_fv, type="l", col="blue", lwd=2, ylab="Dollars", 
     main="FV of $1 invested in SBUX")


Compute probabilities


# X ~ N(0.05, (0.10)^2)
mu_x = 0.05
sigma_x = 0.1

# Pr(X > 0.10)
1 - pnorm(0.10, mean=mu_x, sd=sigma_x)

# Pr(X < -0.10)
pnorm(-0.10, mean=mu_x, sd=sigma_x)


# Pr(-0.05 < X < 0.15)
pnorm(0.15, mean=mu_x, sd=sigma_x) - pnorm(-0.05, mean=mu_x, sd=sigma_x)

# The mean (mu_x) and the standard deviation (sigma_x) are still in your workspace

# 1%, 5%, 95% and 99% quantile
qnorm(c(0.01,0.05,0.95,0.99), mean=mu_x, sd=sigma_x)

# Normally distributed monthly returns
x_vals = seq(-0.25, 0.35, length.out = 100)
MSFT = dnorm(x_vals, mean=0.05, sd=0.1)
SBUX = dnorm(x_vals, mean=0.025, sd=0.05)


# MSFT, SBUX and x_vals are still in your workspace

# Normal curve for MSFT
plot(x_vals, MSFT, type = "l", col = "blue", ylab = "Normal curves", 
     ylim = c(0, 8))
# Add a normal curve for SBUX
lines(x_vals, SBUX, col="red")
# Add a plot legend
legend("topleft", legend = c("Microsoft", "Starbucks"), 
       col = c("blue", "red"), lty = 1)

# R ~ N(0.04, (0.09)^2) 
mu_R = 0.04
sigma_R = 0.09
# Initial wealth W0 = $100,000
W0 = 100000
# The 1% value-at-risk
W0 * qnorm(0.01,mean=mu_R, sd=sigma_R)
# The 5% value-at-risk
W0 * qnorm(0.05,mean=mu_R, sd=sigma_R)

# r ~ N(0.04, (0.09)^2) 
mu_r = 0.04
sigma_r = 0.09
# Initial wealth W0 = $100,000
W0 = 100000
# The 1% value-at-risk

W0 * (exp(qnorm(0.01, mean=mu_r, sd=sigma_r))-1)

W0 * (exp(qnorm(0.05, mean=mu_r, sd=sigma_r))-1)


# Vectors of prices
PA = c(38.23,41.29)
PC = c(41.11,41.74)

# Simple monthly returns
RA = (PA[2]-PA[1])/PA[1]
RC = PC[2]/PC[1] - 1


# The simple returns on Amazon (RA) and Costco (RC) are still in your workspace

# Continuously compounded returns
rA = log(1+RA)
rC = log(1+RC)


# The prices for Amazon (PA) are still in your workspace

# Cash dividend per share
DA = 0.10

# Simple total return
RA_total = (PA[2] - PA[1] + DA) / PA[1]
# Dividend yield
DY =  DA/PA[1]


# The simple monthly return on Amazon (RA) is still in your workspace

# Simple annual return
RA_annual = (1+RA)^ 12 - 1
# Continuously compounded annual return
rA_annual = log(RA_annual + 1)

# The simple returns on Amazon (RA) and Costco (RC) are still in your workspace

# Portfolio shares
xA = 8000 / 10000
xC = 2000 / 10000

# Simple monthly return
xA * RA + xC * RC

# Standard deviations and correlation
sig_x = 0.10
sig_y = 0.05
rho_xy = 0.9
# Covariance between X and Y
sig_xy = rho_xy * sig_x * sig_y
# Covariance matrix
Sigma_xy = matrix(c(sig_x ^ 2, sig_xy, sig_xy, sig_y^2), nrow=2, ncol=2)


# Load the mvtnorm package
library("mvtnorm");
# The covariance matrix (Sigma_xy) is still in your workspace

# Means
mu_x = 0.05
mu_y = 0.025

# Simulate 100 observations
set.seed(123)  # for reproducibility
xy_vals = rmvnorm(100, mean=c(mu_x, mu_y), sigma=Sigma_xy)
head(xy_vals)

# The simulated values (xy_vals) are still in your workspace

# Create scatterplot
plot(xy_vals[,1], xy_vals[,2], pch=16, cex=2, col="blue", main="Bivariate normal: rho=0.9",xlab="x", ylab="y")

# Simulated values (xy_vals) and means (mu_x, mu_y) are still in your workspace

# create scatterplot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho=0.9", xlab = "x", ylab = "y")
# Add lines
abline(h=mu_y)
abline(v=mu_x)


# Means (mu_x, mu_y) and covariance matrix (Sigma_xy) are still in your workspace

# create scatterplot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho=0.9", xlab = "x", ylab = "y")
# Add lines
abline(h = mu_y, v = mu_x)
# Add line segments
segments(x0 = 0, y0 = -1e10, x1 = 0, y1 = 0, col="red")
segments(x0 = -1e10, y0 = 0, x1 = 0, y1 = 0, col="red")

# Compute joint probability
pmvnorm(upper = c(0,0), mean=c(mu_x, mu_y), sigma=Sigma_xy)


# Standard deviations and correlation
sig_x = 0.10
sig_y = 0.05
rho_xy = -0.9
# Covariance between X and Y
sig_xy = rho_xy * sig_x * sig_y
# Covariance matrix
Sigma_xy = matrix(c(sig_x^2, sig_xy, sig_xy, sig_y^2), nrow = 2, ncol = 2)

# Means
mu_x = 0.05
mu_y = 0.025
# Simulate 100 observations
set.seed(123)  # for reproducibility
xy_vals = rmvnorm(100, mean=c(mu_x, mu_y), sigma = Sigma_xy)
head(xy_vals)

# Create scatterplot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho=-0.9", xlab = "x", ylab = "y")
# Add lines
abline(h = mu_y, v = mu_x)
# Add line segments
segments(x0 = 0, y0 = -1e10, x1 = 0, y1 = 0, col="red")
segments(x0 = -1e10, y0 = 0, x1 = 0, y1 = 0, col="red")

# Compute joint probability
pmvnorm(lower = c(-Inf, -Inf), upper = c(0, 0), 
        mean = c(mu_x, mu_y), sigma = Sigma_xy)

# Standard deviations and correlation
sig_x = 0.10
sig_y = 0.05
rho_xy = 0
# Covariance between X and Y
sig_xy = rho_xy * sig_x * sig_y
# Covariance matrix
Sigma_xy = matrix(c(sig_x^2, sig_xy, sig_xy, sig_y^2), nrow = 2, ncol = 2)

# Means
mu_x = 0.05
mu_y = 0.025
# Simulate 100 observations
set.seed(123)  # for reproducibility
xy_vals = rmvnorm(100, mean=c(mu_x, mu_y), sigma = Sigma_xy)
head(xy_vals)

# Create scatterplot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho=0", xlab = "x", ylab = "y")
# Add lines
abline(h = mu_y, v = mu_x)
# Add line segments
segments(x0 = 0, y0 = -1e10, x1 = 0, y1 = 0, col="red")
segments(x0 = -1e10, y0 = 0, x1 = 0, y1 = 0, col="red")

# Compute joint probability
pmvnorm(lower = c(-Inf, -Inf), upper = c(0, 0), 
        mean = c(mu_x, mu_y), sigma = Sigma_xy)

SIMULATE

set.seed(123);
# Simulate 250 observations from the described MA(1) model
ma1_sim = arima.sim(model=list(ma=0.5),mean=0,sd=0.1,n=250) + 0.05


set.seed(123);
# Simulate 250 observations from the described MA(1) model
ma1_sim = arima.sim(model=list(ma=0.5), n=250, mean=0, sd=0.1) + 0.05;

# A line plot of the simulated observations
plot(ma1_sim, type="l", main="MA(1) Process: mu=0.05, theta=0.5", xlab="time",ylab="y(t)");
abline(h=0);


set.seed(123);
# Simulate 250 observations from the described MA(1) model
ma1_sim = arima.sim(model=list(ma=0.5), n=250, mean=0, sd=0.1) + 0.05;
# Generate the theoretical ACF with upto lag 10
acf_ma1_model = ARMAacf(ma=0.5, lag.max = 10)

# Split plotting window in three rows
par(mfrow=c(3,1))
# First plot: The simulated observations
plot(ma1_sim, type="l",main="MA(1) Process: mu=0.05, theta=0.5",xlab="time",ylab="y(t)")
abline(h=0)
# Second plot: Theoretical ACF
plot(1:10, acf_ma1_model[2:11], type="h", col="blue",  ylab="ACF", main="theoretical ACF")
# Third plot: Sample ACF
tmp = acf(ma1_sim, lag.max=10, main="Sample ACF") # Assign to tmp the Sample ACF
# Reset graphical window to only one graph
par(mfrow=c(1,1))


set.seed(123);
# Simulate 250 observations from the described MA(1) model
ma1_sim = arima.sim(model=list(ma=0.9), n=250, mean=0, sd=0.1) + 0.05;
# Generate the theoretical ACF with upto lag 10
acf_ma1_model = ARMAacf(ma=0.9, lag.max=10)

# Split plotting window in three rows
par(mfrow=c(3,1))
# First plot: The simulated observations
plot(ma1_sim, type="l",main="MA(1) Process: mu=0.05, theta=0.9",xlab="time",ylab="y(t)")
abline(h=0)
# Second plot: Theoretical ACF
plot(1:10, acf_ma1_model[2:11], type="h", col="blue", main="theoretical ACF")
# Third plot: Sample ACF
tmp=acf(ma1_sim, lag.max=10, main="Sample ACF")
# Reset graphical window to only one graph
par(mfrow=c(1,1))


set.seed(123);
# Simulate 250 observations from the described AR(1) model
ar1_sim = arima.sim(model=list(ar=0.5),n=250,mean=0,sd=0.1) + 0.05
# Generate the theoretical ACF with ten lags
acf_ar1_model = ARMAacf(ar=0.5, lag.max=10)

# Split plotting window in three rows
par(mfrow=c(3,1))
# Generate the same three graphs as in the previous exercise 
par(mfrow=c(3,1))
# First plot: The simulated observations
plot(ar1_sim, type="l", main="AR(1) Process: mu=0.05, phi=0.5",xlab="time",ylab="y(t)")
abline(h=0)
# Second plot: Theoretical AFC
plot(1:10, acf_ar1_model[2:11], type="h", col="blue", main="theoretical ACF")
# Third plot: Sample AFC
tmp = acf(ar1_sim, lag.max=10, main="Sample ACF")
# Reset plotting window to default
par(mfrow=c(1,1));


# Load relevant packages
library(PerformanceAnalytics);library(zoo);library(tseries);

# Get the monthly adjusted closing price data on VBLTX, FMAGX and SBUX from Yahoo! using the tseries function get.hist.quote(). Set the sample to Jan 1998 through Dec 2009.

# Get the adjusted closing prices from Yahoo!
VBLTX_prices = get.hist.quote(instrument="vbltx", start="1998-01-01",end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")

FMAGX_prices = get.hist.quote(instrument="fmagx", start="1998-01-01",end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")

SBUX_prices = get.hist.quote(instrument="sbux", start="1998-01-01", end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")

# Change the class of the time index to yearmon which is appropriate for monthly data
# index() and as.yearmon() are functions in the zoo package  

index(VBLTX_prices) = as.yearmon(index(VBLTX_prices))
index(FMAGX_prices)  = as.yearmon(index(FMAGX_prices))
index(SBUX_prices)  = as.yearmon(index(SBUX_prices))
# Inspect your data
start(SBUX_prices)
end(SBUX_prices)


# The variables VBLTX_prices, FMAGX_prices and SBUX_prices are preloaded in your workspace

# Create merged price data
all_prices =merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
# Rename columns
colnames(all_prices) = c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns = diff(log(all_prices))

# Look at the return data
start(all_returns)
end(all_returns)
colnames(all_returns) 
head(all_returns)


# 'all_returns' is preloaded in your workspace.

# Plot returns after using the PerformanceAnalytics function chart.TimeSeries().
# This function creates a slightly nicer looking plot than plot.zoo()
chart.TimeSeries(all_returns, legend.loc="bottom", main=" ") 

# The previous charts are a bit hard to read. The PerformanceAnalytics function
# chart.Bar makes it easier to compare the returns of different assets on the 
# same plot
chart.Bar(all_returns, legend.loc="bottom", main=" ")


# Cumulative return plot - must use simple returns (!) and not cc returns for this
# Use PerformanceAnalytics function chart.CumReturns()
simple_returns = diff(all_prices)/lag(all_prices, k=-1);
chart.CumReturns( simple_returns, legend.loc="topleft", wealth.index=TRUE,main="Future Value of $1 invested")


# Create matrix with returns
return_matrix = coredata(all_returns);

# Generate four panel plots
par(mfrow=c(2,2))
hist(return_matrix[,"VBLTX"],main="VBLTX monthly returns",
     xlab="VBLTX", probability=T, col="slateblue1")
boxplot(return_matrix[,"VBLTX"],outchar=T, main="Boxplot", col="slateblue1")
plot(density(return_matrix[,"VBLTX"]),type="l", main="Smoothed density",
     xlab="monthly return", ylab="density estimate", col="slateblue1")
qqnorm(return_matrix[,"VBLTX"], col="slateblue1")
qqline(return_matrix[,"VBLTX"])
par(mfrow=c(1,1))


# Create matrix with returns
return_matrix = coredata(all_returns);

# Show boxplot of three series on one plot
boxplot(return_matrix[,"VBLTX"], return_matrix[,"FMAGX"], return_matrix[,"SBUX"],
        names=colnames(return_matrix), col="slateblue1")

# Do the same thing using the PerformanceAnalytics function chart.Boxplot
# Show boxplot of three series on one plot
chart.Boxplot(all_returns)


# Note: all_returns is preloaded in your workspace

# Create matrix with returns
return_matrix = coredata(all_returns);

summary(return_matrix)

# Compute descriptive statistics by column using the base R function apply()
args(apply)
apply(return_matrix, 2, mean)
apply(return_matrix, 2, var)
apply(return_matrix, 2, sd)

# A nice PerformanceAnalytics function that computes all of the relevant descriptive statistics is table.Stats
apply( return_matrix, 2, skewness)
apply( return_matrix, 2, kurtosis)
table.Stats(all_returns)


# Note: all_returns is preloaded in your workspace

# Create matrix with returns
return_matrix = coredata(all_returns);

summary(return_matrix)

# Compute descriptive statistics by column using the base R function apply()
args(apply)
apply(return_matrix, 2, mean)
apply(return_matrix, 2, var)
apply(return_matrix, 2, sd)

# A nice PerformanceAnalytics function that computes all of the relevant descriptive statistics is table.Stats
apply( return_matrix, 2, skewness)
apply( return_matrix, 2, kurtosis)
table.Stats(all_returns)


# Note: return_matrix is preloaded in your workspace

# Display all possible pair-wise scatter plots

pairs( return_matrix, pch=16, col="slateblue1")
# Compute 3 x 3 covariance and correlation matrices
var( return_matrix)

cor( return_matrix)

VBLTX_prices = get.hist.quote(instrument="vbltx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")
FMAGX_prices = get.hist.quote(instrument="fmagx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")
SBUX_prices = get.hist.quote(instrument="sbux", start="2005-09-01",end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo")

# Change the class of the time index to yearmon, which is appropriate for monthly data.
# index() and as.yearmon() are functions in the zoo package 
index(VBLTX_prices) = as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) = as.yearmon(index(FMAGX_prices))
index(SBUX_prices) = as.yearmon(index(SBUX_prices))

# Create merged price data
all_prices = merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
# Rename columns
colnames(all_prices) = c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns = diff(log(all_prices))

# Create matrix with returns
return_matrix = coredata(all_returns)


# The variable return_matrix is preloaded in your workspace

# Number of observations
n_obs = dim(return_matrix)[1]

# Estimates of sigma2hat
sigma2hat_vals = apply(return_matrix, 2, var)

# Standard Error of sigma2hat
se_sigma2hat = sigma2hat_vals / sqrt(n_obs/2)

se_sigma2hat


# Calculate the correlation matrix
cor_matrix = cor(return_matrix)

# Get the lower triangular part of that 'cor_matrix'
rhohat_vals = cor_matrix[lower.tri(cor_matrix)]

# Set the names
names(rhohat_vals) <- c("VBLTX,FMAGX","VBLTX,SBUX","FMAGX,SBUX")

# Compute the estimated standard errors for correlation
se_rhohat = (1-rhohat_vals^2)/sqrt(dim(return_matrix)[1])

se_rhohat


# The "all_returns" zoo object is preloaded in your workspace
t.test( all_returns[,"VBLTX"])

# The "all_returns" zoo object is preloaded in your workspace

# Test the correlation between VBLTX,FMAGX
cor.test(all_returns[,"VBLTX"],all_returns[,"FMAGX"])

# The "all_returns" zoo object is preloaded in your workspace

# Test the normality of the returns of VBLTX
jarque.bera.test(all_returns[,"VBLTX"])
jarque.bera.test(all_returns[,"VBLTX"])


library("boot")
# Function for bootstrapping sample mean: 
mean_boot = function(x, idx) {
  ans = mean(x[idx])
  ans 
} 
# Construct VBLTX_mean_boot:
VBLTX_mean_boot = boot(return_matrix[,"VBLTX"], statistic = mean_boot, R=999)
# Print the class of VBLTX_mean_boot
class(VBLTX_mean_boot)

# Print VBLTX_mean_boot
VBLTX_mean_boot

# Plot bootstrap distribution and qq-plot against normal
plot(VBLTX_mean_boot)

# Load relevant packages
library("PerformanceAnalytics")
library("zoo")

# Load the data
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/compfin/lab8.RData"))

# Explore the data set
head(returns_df)
tail(returns_df)

# The returns_df data is preloaded in your workspace

# Estimate the parameters: multivariate
mu_hat_annual = apply(returns_df,2,mean)*12   
sigma2_annual = apply(returns_df,2,var)*12
sigma_annual = sqrt(sigma2_annual)
cov_mat_annual = cov(returns_df)*12 
cov_hat_annual = cov(returns_df)[1,2]*12    
rho_hat_annual = cor(returns_df)[1,2]

# The annual estimates of the CER model parameters for Boeing and Microsoft
mu_boeing = mu_hat_annual["rboeing"]
mu_msft = mu_hat_annual["rmsft"]
sigma2_boeing =  sigma2_annual["rboeing"]
sigma2_msft = sigma2_annual["rmsft"]

sigma_boeing = sigma_annual["rboeing"]
sigma_msft = sigma_annual["rmsft"] 
sigma_boeing_msft = cov_hat_annual
rho_boeing_msft = rho_hat_annual



# All data and CER parameters are preloaded in your workspace.
# Type "ls()" in the console to see them.

# The ratio Boeing stock vs Microsoft stock (adds up to 1)
boeing_weights = seq(from=-1, to=2, by=0.1)
msft_weights = 1 - boeing_weights

# Portfolio parameters
mu_portfolio =  boeing_weights*mu_boeing + msft_weights*mu_msft
sigma2_portfolio =  boeing_weights^2 * sigma2_boeing + msft_weights^2 * sigma2_msft + 2*boeing_weights*msft_weights*sigma_boeing_msft
sigma_portfolio = sqrt(sigma2_portfolio)

# Plotting the different portfolios
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="Microsoft", pos=4)

