#install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
library(cmdstanr)
#check_cmdstan_toolchain(fix = TRUE, quiet = TRUE)
library(posterior)
library(bayesplot)
library(coda)
color_scheme_set("brightblue")

### DGP 
#
#  y = beta0 + beta1 * x1 + beta2 * x2 + u
#  u ~ iid N(0,sigma^2)
#  x1 ~ iid N(0,1)
#  x2 ~iid N(0,1)

# simulating a time series
# 
n    = 200
beta = c(0,1,-1) 
sigma = 2
x1 = rnorm(n ,0,1)
x2 =  rnorm(n ,0,1)
x = cbind(rep(1,n),x1,x2)
linpred = x %*% beta
y  = rnorm(n,linpred,sigma)
X_new = matrix(c(0,2,2), nrow=1) 

# Setup code
mod <- cmdstan_model("BM_linreg.stan")
mod$print()

# Running stan code
data_list <- list(N=n, N2=1, K=3, X=x, new_X = X_new, y=y)

fit <- mod$sample(
  data = data_list, 
  seed = 123, 
  chains = 4, 
  parallel_chains = 4,
  refresh = 500 # print update every 500 iters
)

draws <- fit$draws()

#Quality
color_scheme_set("purple")
mcmc_dens_overlay(draws, pars =c("beta[1]", "beta[2]", "beta[3]","sigma"))
mcmc_hist_by_chain(draws, pars = c("beta[1]", "beta[2]", "beta[3]","sigma"))
mcmc_trace(draws, pars = c("beta[1]", "beta[2]", "beta[3]","sigma"))

# Analyze results
fit$summary()

color_scheme_set("blue")
mcmc_dens(draws, pars = c("beta[1]", "beta[2]", "beta[3]","sigma"))
mcmc_pairs(draws, pars = c("beta[1]", "beta[2]", "beta[3]","sigma"))

mcmc_areas(
  draws,
  pars = c("beta[1]", "beta[2]", "beta[3]","sigma"),
  prob = 0.8, # 80% intervals
  prob_outer = 0.99, # 99%
  point_est = "mean"
)



