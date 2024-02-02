# Maximum Likelihood Estimator 

#### Bhuvan Kapoor 

``` r
# Maximum Likelihood Estimator
# Aim: To find Maximum Likelihood for the parameters

library("maxLik")
```

    ## Loading required package: miscTools

    ## 
    ## Please cite the 'maxLik' package as:
    ## Henningsen, Arne and Toomet, Ott (2011). maxLik: A package for maximum likelihood estimation in R. Computational Statistics 26(3), 443-458. DOI 10.1007/s00180-010-0217-1.
    ## 
    ## If you have questions, suggestions, or comments regarding the 'maxLik' package, please use a forum or 'tracker' at maxLik's R-Forge site:
    ## https://r-forge.r-project.org/projects/maxlik/

``` r
set.seed(123)
x <- rnorm(100,1,2)
logLikefunc <- function(param) {
  mu <- param[1]
  sigma <- param[2]
  sum(dnorm(x,mu,sigma, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = c(mu = 0, sigma = 1))
summary(mle)
```

    ## --------------------------------------------
    ## Maximum Likelihood estimation
    ## Newton-Raphson maximisation, 7 iterations
    ## Return code 1: gradient close to zero (gradtol)
    ## Log-Likelihood: -201.5839 
    ## 2  free parameters
    ## Estimates:
    ##       Estimate Std. error t value  Pr(> t)    
    ## mu      1.1808     0.1818   6.497 8.22e-11 ***
    ## sigma   1.8165     0.1285  14.140  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## --------------------------------------------

``` r
x <- rpois(1000,2)
logLikefunc <- function(param) {
  lambda <- param
  sum(dpois(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)
```

    ## --------------------------------------------
    ## Maximum Likelihood estimation
    ## Newton-Raphson maximisation, 5 iterations
    ## Return code 8: successive function values within relative tolerance limit (reltol)
    ## Log-Likelihood: -1690.673 
    ## 1  free parameters
    ## Estimates:
    ##      Estimate Std. error t value Pr(> t)    
    ## [1,]  1.96400    0.04435   44.28  <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## --------------------------------------------

``` r
x <- rexp(1000,4)
logLikefunc <- function(param) {
  lambda <- param
  sum(dexp(x,lambda, log = T))
}
mle <- maxLik(logLik = logLikefunc, start = 1)
summary(mle)
```

    ## --------------------------------------------
    ## Maximum Likelihood estimation
    ## Newton-Raphson maximisation, 6 iterations
    ## Return code 8: successive function values within relative tolerance limit (reltol)
    ## Log-Likelihood: 366.2427 
    ## 1  free parameters
    ## Estimates:
    ##      Estimate Std. error t value Pr(> t)    
    ## [1,]    3.921      0.124   31.63  <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## --------------------------------------------

``` r
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
```

    ## --------------------------------------------
    ## Maximum Likelihood estimation
    ## Newton-Raphson maximisation, 5 iterations
    ## Return code 1: gradient close to zero (gradtol)
    ## Log-Likelihood: -314.1545 
    ## 1  free parameters
    ## Estimates:
    ##      Estimate Std. error t value Pr(> t)    
    ## [1,]     0.70       0.05      14  <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## --------------------------------------------

``` r
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
```

    ## --------------------------------------------
    ## Maximum Likelihood estimation
    ## Newton-Raphson maximisation, 6 iterations
    ## Return code 8: successive function values within relative tolerance limit (reltol)
    ## Log-Likelihood: -667.183 
    ## 1  free parameters
    ## Estimates:
    ##      Estimate Std. error t value Pr(> t)    
    ## [1,]    3.893      0.114   34.16  <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## --------------------------------------------