likelihood = function(n, y, theta)  { return (theta^y*(1-theta)^(n-y)); }
loglike = function(n, y, theta)  { return (y*log(1-theta)+(n-y) * log(1-theta)); }


theta = seq(from=0, to=1, by=0.01);
plot(theta, likelihood(400,72,theta),type="l");
plot(theta, loglike(400,72,theta), type="l");
abline(v=.18);
