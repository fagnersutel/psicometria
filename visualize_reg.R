sample_size <- 10000
x1 <- rnorm(sample_size, mean=3, sd=2)
x2 <- rnorm(sample_size, mean=0, sd=1.5)
b0 <- rnorm(sample_size, mean=0, sd=5)
b1 <- rnorm(sample_size, mean=0, sd=1)
b2 <- rnorm(sample_size, mean=0, sd=.5)

sample_mu <- b0 + b1 * x1 + b2 * x2
sample_sigma <- runif(sample_size, 0 , 50 )
prior_mu <- rnorm(sample_size, sample_mu, sample_sigma)
plot(density(prior_mu), xlab=expression(paste("Outcome ~ N(",mu,"; ",sigma,")")), main="Outcome prior prediction")
