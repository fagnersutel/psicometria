##### Probability Distributions

## install.packages("sn",dep=T)

library(sn)
library(mnormt)

####
#### PROBABILITY DISTRIBUTIONS
####

### BERNOULLI
x <- rbinom(10000, size=1 ,
            prob=.7)## change prob
hist(x,prob=T,breaks=2)
lines(density(x),col="red")

### BINOMIAL
x <- rbinom(10000, size=150 ,.5) ## change size, change prob
hist(x,prob=T)
lines(density(x),col="red")

### POISSON
x <- rpois(10000, lambda=10)## change lambda
hist(x,prob=T)
lines(density(x),col="red")

### NEGATIVE BINOMIAL
x <- rnbinom(10000, size=8 ,.25) ## change size, change prob
hist(x,prob=T)
lines(density(x),col="red")

### UNIFORM
x <- runif(10000, min=0, max=200) ## change min, change max
hist(x,prob=T)
lines(density(x),col="red")

x <- seq(.01, .99, .01)
plot(-1 + 2*x, dbeta(x, 48.69922,11.23828), type="l")
plot(-1 + 2*x, dbeta(x, 1,1 ), type="l")
plot(-1 + 2*x, dbeta(x, 1,1 ), type="l")


### BETA
x <- rbeta(10000,
           shape1=.5, 
           shape2=.5)## shape1-like mean, shape2-like sd
hist(x,prob=T)
lines(density(x),col="red")

#### NORMAL
x <- rnorm(10000,mean=20,sd=1)
hist(x,prob=T)
lines(density(x),col="red")


#### t-student
x <- rt(10000, df=30)### change df
hist(x,prob=T)
lines(density(x),col="black")

#### SKEW NORMAL
par(mfrow=c(2,1))
x2 <- rsn(10000, xi=0,omega=1,alpha=10)
hist(x2,prob=T)
lines(density(x2),col="red")

    x2 <- rsn(10000, xi=0,omega=1,alpha=-10)
    hist(x2,prob=T)
    lines(density(x2),col="red")
par(mfrow=c(1,1))


### MULTIVARIATE NORMAL
x <- rmnorm(10000, mean=c(0,0),
            varcov =  matrix(c(20,-.7,-.7,20),2,2))
plot(x[,1],x[,2])


### CHI-SQUARE
x <- rchisq(10000,df=1)## change df
hist(x,prob=T)
lines(density(x),col="red")


### WISHART
S <- as.matrix(1)
x <- rWishart(10000, df = 10, S)
hist(x, prob=T)
lines(density(x),col="red")

### Gamma
x <- rgamma(10000,1,.5)## change df
hist(x,prob=T)


# see quantiles
x <- rnorm(10000, 0, 2)
hist(x)
quantile(x, probs = c(.25,.75))
round(quantile(x, probs = c(.05,.95)), 5)

