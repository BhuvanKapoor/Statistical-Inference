# Maximum Likelihood Estimator
# Aim: To find Maximum Likelihood for the parameters

library("maxLik")
set.seed(123)
x <- rnorm(100,1,2)
logLikefunc <- function(param) {
  mu <- param[1]
  sigma <- param[2]
  sum(dnorm(x,mu,sigma, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = c(mu = 0, sigma = 1))
summary(mle)

x <- rpois(1000,2)
logLikefunc <- function(param) {
  lambda <- param
  sum(dpois(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)

x <- rexp(1000,4)
logLikefunc <- function(param) {
  lambda <- param
  sum(dexp(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)


# Example 1 : The data represent the number of small factories in Chennai in which industrial injuries resulted in claims for compensation between April 2019 and March 2020
#---------------------------------------------------------#
# Number of Claims    |  0  |  1  |  2  |  3  |  4  | 5+ |
# Observed Frequency  | 144 |  91 |  32 |  11 |  2  | 0  |
#---------------------------------------------------------#
x <- c(rep(0,144),rep(1,91),rep(2,32),rep(3,11),rep(4,2),rep(5,0))
logLikefunc <- function(param) {
  lambda <- param
  sum(dpois(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)


# Example 2: The Poisson distribution has been used by the traffic police engineers as a model for light traffic, based on the rationale that if the rate is approx constant ant the traffic is light, the distribution of counts of cars in a given time interval or space area should be nearly poisson. The following table shows the number of tight times during 300 3 minute interval at a specific intersection. Suppose Poisson model might be good model for this dataset, estimate the parameter Lambda.
#--------------------------------------------------------------------------#
# n |  0 |  1 | 2  |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 | 11 | 12 | 13 |
# f | 14 | 30 | 36 | 68 | 43 | 43 | 30 | 14 | 18 |  6 |  4 |  1 | 1  | 0  |
#--------------------------------------------------------------------------#
x <- c(rep(0,14),rep(1,30),rep(2,36),rep(3,68),rep(4,43), rep(5,43), rep(6,30), rep(7,14), rep(8,10), rep(9,6), rep(10,4), rep(11,1), rep(12,1), rep(13,0))
logLikefunc <- function(param) {
  lambda <- param
  sum(dpois(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)
