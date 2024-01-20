# Confidence Interval for Large Sample (n>30)

# Confidence Interval for Proportions
# Confidence Interval = [p +/- z*(sqrt(p(1-p)/n))]

# install.packages("glue")
library(glue)

# Ques: A machine shop manufacturers toggle levers. A lever is flawed if a standard nut cannot be screwed onto the threads. Let p equal the proportion of flawed toggle levers that a the shop manufactures. If there were 24 flawed levers out of a sample of 642 that were selected randomly from the production line.
# (a) Give a point estimate of p. (b) Find an approximate 95% and 99% confidence interval for p.

n <- 642
# (a) point estimate
p <- 24/n
#(b)
se <- sqrt(p*(1-p)/n)
#95%
z_star <- qnorm(1-(1-0.95)/2)
me <- z_star*se
glue("({p-me},{p+me})")
#99%
z_star <- qnorm(1-(1-0.99)/2)
me <- z_star*se
glue("({p-me},{p+me})")


# Ques: A random sample of 500 apples was taken from a large consignment and 60 were found to be bad. Obtain 95%,98% confidence interval limits for the percentage number of bad apple in the consignment.

n <- 500
p <- 60/n 
SE <- sqrt(p*(1-p)/n)
# 95%
z_star <- qnorm(1-(1-0.95)/2) 
ME <- z_star*SE
glue("({p-ME}, {p+ME})")
# 98%
z_star <- qnorm(1-(1-0.98)/2) 
ME <- z_star*SE
glue("({p-ME}, {p+ME})")


# Ques: In a random sample, 40 of 500 persons given a COVID-19 vaccine experienced some discomfort. Construct a 95% and 98% confidence interval for the true proportion of person who will experience some discomfort from the vaccine.

n <- 500
p <- 40/n
se <- sqrt(p*(1-p)/n)
#95%
z_star <- qnorm(1-(1-0.95)/2)
me <- z_star*se
glue("({p-me},{p+me})")
#98%
z_star <- qnorm(1-(1-0.98)/2)
me <- z_star*se
glue("({p-me},{p+me})")


# Ques: A random sample of 400 bulbs contained 13 defective bulbs, Find 90% and 95% confidence interval for the proportion of defective bulbs in the population.

n <- 400
p <- 13/400
SE <- sqrt(p*(1-p)/n)
#90%
z_star <- qnorm(1-(1-0.9)/2)
ME <- z_star*SE
glue("({p-ME},{p+ME})")
#95%
z_star <- qnorm(1-(1-0.95)/2)
ME <- z_star*SE
glue("({p-ME},{p+ME})")

# Confidence Interval for Mean
# Confidence Interval = [xbar +/- z*(sigma/sqrt(n))]

# Ques: A paint manufacturer wants to determine the average drying time of a new interior wall paint. If for 32 test areas of equal size be obtained a mean drying time of 66.3 minutes and a standard deviation of 8.4 minutes. Construct a 90% and 99% confidence interval for the true mean.

n <- 32
xbar <- 66.3
sd <- 8.4
se <- sd/sqrt(n)
#90%
z_star <- qnorm(1-(1-0.9)/2)
me <- z_star*se
glue("({xbar-me},{xbar+me})")
#99%
z_star <- qnorm(1-(1-0.99)/2)
me <- z_star*se
glue("({xbar-me},{xbar+me})")


# Ques: An industrial designer wants to determine the average amount of time it takes an adult to assemble an "easy-to-assemble" toy. Consider following data as a random sample (in minutes): 17,13,18,19,17,21,29,22,16,28,21,15,26. Construct 95%, 98% and 99% confidence interval for the mean.

x <- c(17,13,18,19,17,21,29,22,16,28,21,15,26)
xbar <- mean(x)
sigma <- sqrt(var(x))
se <- sigma/sqrt(length(x))
#95%
t_star <- qt(1-(1-0.95)/2,length(x)-1)
me <- t_star*se
glue("({xbar-me},{xbar+me})")
#98%
t_star <- qt(1-(1-0.98)/2,length(x)-1)
me <- t_star*se
glue("({xbar-me},{xbar+me})")
#99%
t_star <- qt(1-(1-0.99)/2,length(x)-1)
me <- t_star*se
glue("({xbar-me},{xbar+me})")


# Ques: A sample of 900 members has a mean 3.4 cms and sd 2.61 cms. If the population is normal and its mean is unknown, find the 95% and 98% confidence interval limits of the true mean. 

n <- 900
sigma <- 2.61 
xbar <- 3.4 
SE <- sqrt(sigma/(sqrt(n)))
# 95%
z_star <- qnorm(1-(1-0.95)/2) 
ME <- z_star*SE 
glue('({xbar-ME}, {xbar+ME})')
# 98%
z_star <- qnorm(1-(1-0.98)/2) 
ME <- z_star*SE 
glue('({xbar-ME}, {xbar+ME})')


# Ques: The mean muscular confidence interval score of a random sample of 60 subjects was found to be 145 with a standard deviation of 40. Construct a 95% confidence interval for the true mean. Assume the sample size to be large enough for normal approximation.

n <- 60 
xbar <- 145
sd <- 40 
se <- sd/(sqrt(n))
#95%
z_star <- qnorm(1-(1-0.95)/2) 
ME <- z_star*se
glue("({xbar-ME},{xbar+ME})")


# Ques: The standard deviation of the test scores on a certain achievement test is 11.3. If a random sample of 81 students had a sample mean of 74.6. Find a 90% confidence interval estimate for the average score of all students.

n <- 81
sigma <- 11.3
xbar <- 74.6
SE <- sigma/sqrt(n)
z_star <- qnorm(1-(1-0.9)/2)
ME <- z_star*SE
glue("({xbar-ME},{xbar+ME})")


# Ques: Find the p-value where the z-score is 2.39 for two-tailed hypothesis test.
2*pnorm(2.39,lower.tail = F)


# Confidence Interval for a Difference in Proportions
# confidence interval = [(p1-p2) +/- z*(sqrt((p1(1-p1)/n)+(p2(1-p2)/n))]

# Ques: A medical researcher conjecture that smoking can result in the wrinkled skin around the eyes. The researches recruited 150 smokers and 250 nonsmokers to take part in observational study and found that 95 of the smokers and 105 of nonsmokers were seen to have prominent wrinkles around the eyes. Find confidence interval for the true difference that would exist between these 2 groups in the population.

smokers <- 150 
non_smokers <- 250 

p_smokers <- 95/smokers
p_non_smokers <- 105/non_smokers 

se <- sqrt((p_smokers*(1-p_smokers)/smokers)+(p_non_smokers*(1-p_non_smokers)/non_smokers))
# 95%
z_star <- qnorm(1-(1-0.95)/2)
me <- z_star*se
glue("({abs(p_smokers-p_non_smokers)-me},{abs(p_smokers-p_non_smokers)+me})")


# Ques: Two brands of refrigerators, denoted A and B, are each guaranteed for 1 year. In a random sample of 50 refrigerators of brand A, 12 were observed to fall before the guarantee period ended. An independent random sample of 60 brand 8 refrigerators also revealed 12 failures during the guarantee period, Estimate true difference (p1-p2) between proportions of failures during the period, with confidence coefficient approximately 98%.

n1 <- 50
n2 <- 60
p1 <- 12/n1
p2 <- 12/n2
# 98%
z_star <- qnorm(1-(1-0.98)/2)
SE <- sqrt(p1*(1-p1)/n1 + p2*(1-p2)/n2)
ME <- z_star*SE
glue("({(p1-p2)-ME},{(p1-p2)+ME})")


# Confidence Interval in Difference in Mean
# CI = x_bar1-X_bar2 +/- z*(sqrt((var1/n1)+(var2/n2)))

# Ques: In certain factory there two independent processes manufacturing the same item. The average weight in a sample of 250 items produced from one process is found to be 120oz with a standard deviation of 12 oz. while the corresponding figures in a sample of 400 items from other process are 24 and 14. means find the 99% CI for the difference in the average weights of the items produced by the two processes respectively.

n1 <- 250 
n2 <- 400 
xbar_1 <- 120 
xbar_2 <- 124 
var_1 <- 12**2 
var_2 <- 14**2

se <- sqrt((var_1/n1)+(var_2/n2))
z_star <- qnorm(1-(1-0.99)/2)
me <- z_star*se 
glue("({abs(xbar_1-xbar_2)-me},{abs(xbar_1-xbar_2)+me})")


# Ques: Let X and Y equal the hardness of the hot and cold water respectively in a campus building. Hardness is measured in terms of the calcium ion concentrate (in ppm). The following data were collected 
#---------------------------------------------------------------------------------------------------#
# X | 133.5 | 137.2 | 136.3 | 133.3 | 137.5 | 135.4 | 138.4 | 137.1 | 136.5 | 139.4 | 137.9 | 136.8 #
# Y | 134.0 | 134.7 | 136.0 | 132.7 | 134.6 | 135.2 | 135.9 | 135.6 | 135.8 | 134.0 |               #
#---------------------------------------------------------------------------------------------------#
# Construct a 95%, 98% and 99% confidence interval for the difference of mean assuming that the distribution of X and Y are normal.

x <- c(133.5,137.2,136.3,133.3,137.5,135.4,138.4,137.1,136.5,139.4,137.9,136.8)
y <- c(134,134.7,136,132.7,134.6,135.2,135.9,135.6,135.8,134)
n1 <- length(x)
n2 <- length(y)

xbar <- mean(x)
ybar <- mean(y)

sigma_x <- sqrt(var(x))
sigma_y <- sqrt(var(y))

se <- sqrt((sigma_x^2/n1)+(sigma_y^2/n2))
#95%
t_star <- qt(1-(1-0.95)/2,n1+n2-2)
me <- t_star*se
glue("({abs(xbar-ybar)-me},{abs(xbar-ybar)+me})")
#98%
t_star <- qt(1-(1-0.98)/2,n1+n2-2)
me <- t_star*se
glue("({abs(xbar-ybar)-me},{abs(xbar-ybar)+me})")
#99%
t_star <- qt(1-(1-0.99)/2,n1+n2-2)
me <- t_star*se
glue("({abs(xbar-ybar)-me},{abs(xbar-ybar)+me})")


# Ques: Two samples drawn from two different populations gave the following results
#---------------------------------------------#
#          | Size | Mean | Standard Deviation #
# Sample 1 | 400  | 124  | 14                 #
# Sample 2 | 250  | 120  | 12                 #
#---------------------------------------------#
# Find the 95% confidence interval for the difference of population means.

n1 <- 400
n2 <- 250
xbar <- 124
ybar <- 120
sigma_x <- 14
sigma_y <- 12
se <- sqrt((sigma_x^2/n1)+(sigma_y^2/n2))
#95%
z_star <- qnorm(1-(1-0.95)/2)
me <- z_star*se
glue("({abs(xbar-ybar)-me},{abs(xbar-ybar)+me})")
