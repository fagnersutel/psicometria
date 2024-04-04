(bx <- qnorm(c(0.025, 0.975), mean=0, sd=5))

#
sample_mu <- rnorm( 10000 , 178 , 20 )
sample_sigma <- runif( 10000 , 0 , 50 )
prior_h <- rnorm( 10000 , sample_mu , sample_sigma )
plot( density(prior_h),xlab="Height",main=expression(paste(mu, " ~ N(178; 20); ", sigma, " ~ U(0; 50)")))
quantile(prior_h, probs = c(0.025, 0.975))


library(ggplot2)
ggplot(data.frame(prior_h),
       aes(x = prior_h))+
    geom_density(fill  = "yellow", 
                 alpha = .5)+
    geom_vline(xintercept = 0, 
               col  = "red",
               size = 1)+
    scale_x_continuous(name   = "Value") + 
    geom_vline(xintercept = unlist(quantile(prior_h, probs = c(0.025, 0.975))),
               col = "blue",
               linetype = 2) +
    theme_light() +
    labs(title = "Prior Predictive Simulation")
