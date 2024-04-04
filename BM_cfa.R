#install.packages("blavaan")
#install.packages("brms")
library(blavaan)
library(rstan)
library(brms)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

################################################################################
## data import

dat <- read.csv("pos_neg.csv")
head(dat)
summary(dat)
dim(dat)

################################################################################
mod1 <- 'Positive =~ great + cheerful + happy
          Negative =~ sad + down + unhappy
					'
fit.mod1 <-  bcfa(mod1, data=dat, std.lv=T,
               n.chains = 3, burnin=5000, 
               sample=1000, target = "stan")
summary(fit.mod1, standardized=T,
        rsquare=T,neff=TRUE,postmedian=T)
fitMeasures(fit.mod1)

std_all <- standardizedposterior(fit.mod1)
head(std_all)
posterior_summary(std_all[,7:12])
posterior_summary(1-std_all[,7:12]) ## R2

### save latent variable scores
fit.mod1_lvs <-  bcfa(mod1, data=dat, std.lv=T,
                   n.chains = 3, burnin=5000, 
                   sample=1000, target = "stan", save.lvs=T)

lvs <- blavInspect(fit.mod1_lvs, "lvs") ## mcmc factor scores
head(lvs[[1]])
lvs_mat <- as.matrix(lvs)
head(lvs_mat)
dim(lvs_mat)
hist(lvs_mat[,1])

lv_mean <- blavInspect(fit.mod1_lvs, "lvmeans") ## factor score means
head(lv_mean)
cor(lv_mean)

################################################################################
################################################################################
mod2 <- 'Positive =~ great + cheerful + happy
          Negative =~ sad + down + unhappy
          down ~~ unhappy
          '

fit.mod2 <-  bcfa(mod2, data=dat, std.lv=T,
               n.chains = 3, burnin=5000, 
               sample=1000, target = "stan")
summary(fit.mod2, standardized=T,rsquare=T,postmedian=TRUE)
fitMeasures(fit.mod2)

blavCompare(fit.mod1, fit.mod2)

mcs <- blavInspect(fit.mod2, "mcmc")
mcs <- as.matrix(mcs)
head(mcs)
dim(mcs)
hist(mcs[,"ly_sign[4]"])

psych::describe(mcs)
sum(mcs[,"ly_sign[4]"] > .1)/nrow(mcs)

partable(fit.mod2)
hypothesis(mcs, "ly_sign[4] > 0.1")

##### Model fit

## basic, without null model
ML_bs <- blavFitIndices(fit.mod2)
ML_bs
summary(ML_bs, prob=.95,central.tendency = c("mean","median"))


## Access the posterior distributions for further investigation
distML <- data.frame(ML_bs@indices)
head(distML)

hist(distML$BGammaHat)
sum(distML$BGammaHat > .9) / nrow(distML)

mcmc_pairs(distML, 
           pars = c("BRMSEA","BGammaHat","adjBGammaHat"),
           diag_fun = "hist")

########################################################
##### weakly informative priors
########################################################
fit.mod3 <-  bcfa(mod2, data=dat, std.lv=T,
                  n.chains = 3, burnin=10000, 
                  sample=5000,target="stan",
                  dp=dpriors(lambda="normal(0,10)", 
                             nu="normal(0,10)", target="stan"))
summary(fit.mod3, standardized=T,rsquare=T,postmedian=TRUE)
fitMeasures(fit.mod3)

fits_st <- cbind(fitMeasures(fit.mod1), 
                 fitMeasures(fit.mod2),
                 fitMeasures(fit.mod3))
round(fits_st,4)			
