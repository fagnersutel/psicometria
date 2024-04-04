#download data
ds <- readr::read_csv('https://ndownloader.figshare.com/files/22299075')
#SIJS --- short index of job satisfaction
#SIJS1 --- I feel fairly satisfied with my present job
#SIJS2 --- Most days I am enthusiastic about my work
#SIJS3 --- Each day at work seems like it will never end (R)
#SIJS4 --- I find real enjoyment in my work
#SIJS5 --- I consider my job to be rather unpleasant (R)

#(R) --- item already reversed in the dataset
psych::glb(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")], key=NULL)
#the function to be used "ufs"
plot(0,0)
ufs::scaleStructure(dat = ds,
                    items = c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5"))

#if you do not recode them (let's say you want to use the original data)
ds[,c("SIJS3", "SIJS5")] <- 6 - ds[,c("SIJS3", "SIJS5")]

#the alpha estimates will be severely underestimated
ufs::scaleStructure(dat = ds,
                    items = c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5"))

#check the correlations with the items before being correctly recoded
cor(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")]) |> round(2)


#if you do not recode them (let's say you want to use the original data)
ds[,c("SIJS3", "SIJS5")] <- 6 - ds[,c("SIJS3", "SIJS5")]

#check the correlations with the items after being correctly recoded
cor(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")]) |> round(2)

