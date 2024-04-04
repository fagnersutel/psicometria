data0=data.frame(Item_1=c(0,1,1,1,1,1,1,1,1,1),Item_2=c(0,0,0,0,0,0,0,0,1,1),Item_3=c(0,1,0,1,0,1,0,1,0,1))
data0
library(mirt)
mirt(data = data0, model = 1, itemtype ="3PL", verbose =FALSE)

data <- expand.table(LSAT7)
# coleto dez linhas aleatórias e 3 itens 
data3itens = data[sample(nrow(data), 10), 1:3] 
mirt(data = data3itens ,model = 1, itemtype ="3PL", verbose =FALSE)

# coleto dez linhas aleatórias e 4 itens 
data4itens = data[sample(nrow(data), 10), 1:4] 
mirt(data = data4itens ,model = 1, itemtype ="3PL", verbose =FALSE)

# coleto dez linhas aleatóriase e 5 itens
data5itens = data[sample(nrow(data), 10), 1:5] 
mirt(data = data5itens ,model = 1, itemtype ="3PL", verbose =FALSE)

data0
data3itens
data4itens
data5itens
