# Confidence Interval for Small Sample (n<30)

# Confidence Interval for single mean
# Confidence Interval = [xbar +/- t(n-1)(1-alpha/2)*s/sqrt(n)]

# install.packages("glue")
library(glue)

# Ques: A random sample of 10 boys had the following I.Q's: 70,120,110,101,88,83,95,98,107,100. Find a reasonable range in which most of the mean I.Q. values of sample of 10 boys lie (95%).

iqs <- c(70,120,110,101,88,83,95,98,107,100)
t.test(iqs, conf.level = 0.95)


# Ques: A random sample of 16 values from a normal population showed a mean of 41.5 and a sum of squared deviation is 135. Find the confidence interval for 95% & 99%. 

n <- 16
dev <- 135
sigma <- sqrt(dev/(n-1))
xbar <- 41.5
SE <- sigma/sqrt(n)
#95%
t_value <- qt(1-(1-0.95)/2,n-1)
ME <- t_value*SE
glue("({xbar-ME},{xbar+ME})")
#99%
t_value <- qt(1-(1-0.99)/2,n-1)
ME <- t_value*SE
glue("({xbar-ME},{xbar+ME})")


# Ques: The feeding habits of two species of net-casting spiders are studied.

sample1 <- c(12.9,10.2,7.4,7,10.5,11.9,7.1,9.9,14.4,11.3)
sample2 <- c(10.2,6.9,10.9,11,10.1,5.3,7.5,10.3,9.2,8.8)

t.test(sample1, sample2, conf.level = 0.95, paired = F)


# Ques: Find the p-value associated with the z-score of 2.23 in a right-tailed hypothesis test. 
pnorm(2.23, lower.tail = F)


# Ques: Find the p-value associated with the z-score of -0.795 in a left-tailed hypothesis test. 
pnorm(-0.795, lower.tail = T)


# Ques: Find the p-value associated with the z-score of 2.92 in a two-tailed hypothesis test. 
2*pnorm(2.92, lower.tail = F)


# Ques: Find the p-value associated with the t-score of 2.06 in a two-tailed hypothesis test. 
2*pt(2.06,25, lower.tail = F)


# Ques: Each of 20 science students independently measured the melting point of lead. The sample mean and sample standard deviation of these measurements were (in degrees centigrade) 330.2 and 15.4, respectively. Construct (a) a 95 percent and (b) a 99 percent confidence interval estimate of the true melting point of Lead.

n <- 20
sigma <- 15.4
xbar <- 330.2
SE <- sigma/sqrt(n)
SE
#95%
t_star <- qt(1-(1-0.95)/2,n-1)
ME <- t_star*SE
glue("({xbar-ME},{xbar+ME})")
#99%
t_star <- qt(1-(1-0.99)/2,n-1)
ME <- t_star*SE
glue("({xbar-ME},{xbar+ME})")


# Ques: A civil engineer wishes to measure the compressive strength of two different types of concrete. The following data (in psi) is obtained
#----------------------------------------------------------------------------------------#
# Type 1 | 3,250 | 3,268 | 4,302 | 3,184 | 3,266 | 3,297 | 3,332 | 3,502 | 3,864 | 3,116 #
# Type 2 | 3,094 | 3,106 | 3,004 | 3,066 | 2,984 | 3,124 | 3,316 | 3,212 | 3,380 | 3,018 #
#----------------------------------------------------------------------------------------#
# If we assume that the samples are normal with a common variance, determine a 95% two-sided confidence interval for difference in mean.

sample1 <- c(3250,3268,4302,3184,3266,3297,3332,3502,3064,3116)
sample2 <- c(3094,3106,3004,3066,2984,3124,3316,3212,3380,3018)
t.test(sample1, sample2, conf.level = 0.95, paired = F)


# Ques: Find the p-value where t-score is 2.83 for one-tailed hypothesis test with degree of freedom 14.
pt(2.83,14,lower.tail = F)


# Ques: Find the p-value where t-score is 2.02 for one-tailed hypothesis test with degree of freedom 14.
pt(2.02,14,lower.tail = F)
