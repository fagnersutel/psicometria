library(readxl)
ds <- read_excel("assets/data/38511278.xlsx") #replace it with your path.
ds <- read_excel("data partly.xlsx") #replace it with your path.

 
#rename columns, since they are in Chinese (on the original dataset)
colnames(ds) <- c("id",
                  "time_spent",
                  "gender",
                  "age_group",
                  "driving_experience_years",
                  "driving_experience_years_group",
                  "annual_mileage",
                  "monthly_salary",
                  "education_level",
                  "other_insurance",
                  "have_accident",
                  "accident_speed_highway",
                  "speed_fine_highway",
                  "speed_bellow_limit",
                  "ATT1", "SN1", "IN1",
                  "SN2", "BH1", "PBC1",
                  "ATT3", "RP1", "IN2",
                  "BH2", "ATT2", "RP2",
                  "SN3", "PBC2", "SN4",
                  "RP3", "attention_check",
                  "BH3", "PBC3", "ATT4",
                  "IN3", "BH4", "PBC4")

dfnum = ds
#gender --- respondent gender
ds$gender <- factor(ds$gender,
                    levels = c(1,2),
                    labels = c("Female","Male"))
#age_group --- respondent age group
ds$age_group <- ordered(ds$age_group,
                        levels = c(1:5),
                        labels = c("18-30","31-40","41-50","51-60",">60"))
#driving_experience_years --- driving experience in years
#driving_experience_years_group --- driving experience (years group
ds$driving_experience_years_group <- ordered(ds$driving_experience_years_group,
                                             levels = c(1:4),
                                             labels = c(" 1",
                                                        "2–5",
                                                        "6–10",
                                                        " 11"))
#annual_mileage --- Annual mileage (km)
ds$annual_mileage <- ordered(ds$annual_mileage, levels = c(1:5),
                             labels = c("<10,000",
                                        "10,000–20,000",
                                        "20,000–40,000",
                                        "40,000–60,000",
                                        "￿60000"))
#monthly_salary --- Monthly income (Renminbi; currency of PR China )
ds$monthly_salary <- ordered(ds$monthly_salary, levels = c(1:3),
                             labels = c("￿5,000",
                                        "5,000–10,000",
                                        "￿10,000"))
#education_level --- respondent education level
ds$education_level <- ordered(ds$education_level, levels = c(1:3),
                              labels = c("Lower secondary or below",
                                         "Secondary education",
                                         "Tertiary education"))
#other_insurance --- Insurance other than mandatory insurance
ds$other_insurance <- factor(ds$other_insurance,
                             levels = c(1,2),
                             labels = c("Yes","No"))
#have_accident --- Accident experience
ds$have_accident <- factor(ds$have_accident,
                           levels = c(1,2),
                           labels = c("Yes","No"))
#accident_speed_highway --- Accident experience in the highway due to high speed
ds$accident_speed_highway <- factor(ds$accident_speed_highway,
                                    levels = c(1,2),
                                    labels = c("Yes","No"))
#speed_fine_highway --- Fine experience in the highway due to high speed
ds$speed_fine_highway <- factor(ds$speed_fine_highway,
                                levels = c(1,2),
                                labels = c("Yes","No"))
#speed_bellow_limit --- Low-speed driving frequency
ds$speed_bellow_limit <- ordered(ds$speed_bellow_limit,
                                 levels = c(1:5),
                                 labels = c("Never", "Rarely drive at low-speed", "Sometimes / occasionally dive
  at low-speed", "Often dive at low-speed", "Always dive at low-speed"))
att_items <- paste0("ATT",1:4)
sn_items <- paste0("SN",1:4)
pbc_items <- paste0("PBC",1:4)
in_items <- paste0("IN",1:3)
bh_items <- paste0("BH",1:4)
rp_items <- paste0("RP",1:3)
#make the vector c(att_items, sn_items, pbc_items, in_items, bh_items, rp_items)
#as ordered factors with levels from 1-5 with labels "Definitely disapprove"
#to "Definitely approve"
 
 
ds[,c(att_items, sn_items, pbc_items, in_items, bh_items, rp_items)] <- lapply(
  ds[,c(att_items, sn_items, pbc_items, in_items, bh_items, rp_items)],ordered,
  levels = 1:5,
  labels = c("Definitely disapprove", "Disapprove", "Neutral", "Approve",
             "Definitely approve"))


# The scaleStructure function (which was originally called scaleReliability) computes a number 
# of measures to assess scale reliability and internal consistency. Note that to compute omega, 
#the MBESS and/or the psych packages need to be installed, which are suggested packages and 
# therefore should be installed separately (i.e. won't be installed automatically). 


# Omega
 
# The omega (ω) coefficient is also a reliability measure of internal consistency. ω represents an estimate of 
# the general factor saturation of a test that was proposed by McDonald. (Zinbarg et al. 2005) 
# compare McDonald’s Omega to Cronbach’s α and Revelle’s β
 
# They conclude that omega is the best estimate (Zinbarg et al. 2006).
 
# A very handy way to calculate McDonald’s ω
# is to use the scaleReliability() function from the userfriendlyscience package (which also provides 
# Cronbach’s α and the Greatest Lower Bound (GLB) estimate which is also a very good and innovative 
# measure of reliability) (see also Peters 2014).

ufs::scaleStructure(dat = ds,
                    items = c("ATT1","ATT2","ATT3", "SN1", "SN2", "SN3", "BH1", "BH2", "BH3"))



# Information about this analysis:
#   
#   Dataframe: ds
# Items: ATT1, ATT2, ATT3, SN1, SN2, SN3, BH1, BH2, BH3
# Observations: 374
# Positive correlations: 36 out of 36 (100%)        -> Correlações
# 
# Estimates assuming interval level:
#   
# Omega (total): 0.85                               -> Consistência interna
# Omega (hierarchical): 0.76
# Revelle's omega (total): 0.85
# Greatest Lower Bound (GLB): 0.86
# Coefficient H: 0.85
# Coefficient alpha: 0.77


# 1.4 Correlations among Items
library(rio)
# https://rpubs.com/asghar_minaei/857065
dfcor <- dfnum[, c("ATT1","ATT2","ATT3", "SN1", "SN2", "SN3", "BH1", "BH2", "BH3")]
dfcor

# Especificar modelo
mod.one.fCat <- 'psyctcsm =~ ATT1 +  ATT2 +  ATT3 +  SN1 +  SN2 +  SN3 +  BH1 +  BH2 +  BH3'
mod.one.fCat
# Estimar modelo
library(lavaan)
fit.one.fCat <- cfa(mod.one.fCat, data=dfcor, std.lv=TRUE, ordered=T, estimator='WLSMV')

# Resultados
summary(fit.one.fCat, fit.measures=TRUE, standardized=TRUE)


# 1.5 Spearman-Brown Prophecy Formula
#install.packages("splithalf")
library(splithalfr)
# Calculate coefficient based on ICC, two-way, random effects, absolute agreement, single rater
spearman_brown(dfcor[, "ATT1"], dfcor[, "ATT2"])
#           ATT2
# ATT1 0.771888
library(psychometric)
Details

# Nlength represents a ratio of new to original. If the new test has 10 items, and the original test has 5 
# items, Nlength is 2. Likewise, if the original test has 5 items, and the new test has 10 items, Nlength is .5.
# In general, researchers should aim for reliabilities > .9.
 
# SBrel is used to address the question, what if I increased/decreased my test length? What will the new 
# reliability be? This is used when computing split-half reliabilities and when when concerned about reducing 
# test length.
# SBlength is used to address the question, how long must my test be (in relation to the original test) in 
# order to achieve a desired reliability?
#   The formulae for each are:
#   rxxp <- Nlength*rxx/(1+(Nlength-1)*rxx)
# N <- rxxp*(1-rxx)/(rxx*(1-rxxp)) 
#Nlength = tamanho do novo dataset/ tamanho do antigo dataset (10/5)=2

#SBrel(Nlength, rxx)
SBrel(374, .77)
# [1] 0.999202
#SBlength(rxxp, rxx)
nrow(dfcor)
# [1] 374
SBlength(.85, .77)*nrow(dfcor)
# [1] 633.0476
