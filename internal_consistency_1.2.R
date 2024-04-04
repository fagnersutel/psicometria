ds <- readr::read_csv('https://ndownloader.figshare.com/files/22299075')
#remotes::install_gitlab('r-packages/ufs')
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()
save(df, file = "ds.Rda")
ds = ds[complete.cases(ds[, c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5"),]), ]
ds

# Com Erro
psych::glb(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")], key=NULL)
ufs::scaleStructure(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")])

# Chamando plot()
plot(0,0)

# bora 01
psych::glb(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")], key=NULL)

head(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")])
# bora 02
ufs::scaleStructure(ds[,c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5")])

ufs::scaleStructure(
  dat=ds,
  items=c("SIJS1","SIJS2", "SIJS3","SIJS4", "SIJS5"),
  ci=FALSE
)


