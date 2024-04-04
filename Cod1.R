install.packages('ufs')
install.packages('MBESS')
install.packages('psych')

df = readr::read_csv('https://ndownloader.figshare.com/files/22299075')

ufs::scaleStructure(dat = df,
                    items = c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5"))

library(dplyr)
glimpse(df)

