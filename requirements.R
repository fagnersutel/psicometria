packages <-  c("pacman")
## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

pacman::p_load(PerformanceAnalytics,
               regclass,
               lm.beta,
               lmtest,
               rcompanion,
               rstatix,
               dplyr,
               ggstatsplot,
               DescTools,
               ggplot2,
               dplyr,
               tidyverse,
               psych,
               readr,
               timeDate,
               DescTools,
               haven,
               Hmisc,
               readr,
               ez,
               lsr,
               skimr,
               car,
               agricolae,
               coin,
               FSA,
               PMCMR,
               sampling,
               ggstatsplot,
               NSM3,
               rosetta,
               nortest,
               lavaan,
               semTools,
               rstan,
               rstanarm,
               rstantools,
               cmdstanr,
               bayesplot,
               brms,
               ggmcmc,
               psychometric,
               blavaan,
               mirt,
               ltm,
               factoextra,
               ggfortify,
               reshape2,
               corrplot)
