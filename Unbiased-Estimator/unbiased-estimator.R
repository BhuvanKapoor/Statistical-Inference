# Simulation to show sample mean is an unbiased estimator for population mean

# Ques: When X1, X2,..., X10 is a random sample from an exponential random variable with rate 2.

exp_sample <- rexp(10,2)
exp_sample_mean <- mean(sample)
exp_sample_mean
simu_data_exp <- replicate(10000,{
  sample1 = rexp(10,2)
  mean(sample1)
})
mean(simu_data_exp)
plot(density(simu_data_exp), main = "Density plot for means of simulation data")


# Ques: When X1, X2,..., X10 is a random sample from an poisson random variable with lambda 4.

poisson_sample <- rpois(10,4)
poisson_mean <- mean(poisson_sample)

simu_data_poisson <- replicate(100000,{
  rpois(10,4)
  mean(rpois(10,4))
})
mean(simu_data_poisson)

plot(density(simu_data_poisson), main = "Density plot for means of simulation data")
