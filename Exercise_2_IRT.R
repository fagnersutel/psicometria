#Data of example------------------------------
library(mirt)
mydata=data.frame(Item_1=c(0,1,1,1,1,1,1,1,1,1),Item_2=c(0,0,0,0,0,0,0,0,1,1),Item_3=c(0,1,0,1,0,1,0,1,0,1))

irt_model_1PL <-mirt(data = mydata,model = 1, , itemtype ="Rasch", verbose =FALSE)
coef(irt_model_1PL, as.data.frame=TRUE)
plot(irt_model_1PL, type ='trace')
plot(irt_model_1PL, type ='info')
plot(irt_model_1PL, type ='infotrace')

irt_model_2PL <-mirt(data = mydata,model = 1, , itemtype ="2PL", verbose =FALSE)
coef(irt_model_2PL, as.data.frame=TRUE)
plot(irt_model_2PL, type ='trace')
plot(irt_model_2PL, type ='info')
plot(irt_model_2PL, type ='infotrace')

irt_model_3PL <-mirt(data = mydata,model = 1, , itemtype ="3PL", verbose =FALSE)
coef(irt_model_3PL, as.data.frame=TRUE)
plot(irt_model_3PL, type ='trace')
plot(irt_model_3PL, type ='info')
plot(irt_model_3PL, type ='infotrace')

##Random sampling--------------------------------------

mirt(data = data0, model = 1, itemtype ="3PL", verbose =FALSE)

data <- expand.table(LSAT7)
# coleto dez linhas aleat?rias e 3 itens 
data3itens = data[sample(nrow(data), 10), 1:3] 
mirt(data = data3itens ,model = 1, itemtype ="3PL", verbose =FALSE)

# coleto dez linhas aleat?rias e 4 itens 
data4itens = data[sample(nrow(data), 10), 1:4] 
mirt(data = data4itens ,model = 1, itemtype ="3PL", verbose =FALSE)

# coleto dez linhas aleat?riase e 5 itens
data5itens = data[sample(nrow(data), 10), 1:5] 
mirt(data = data5itens ,model = 1, itemtype ="3PL", verbose =FALSE)

data3itens
data4itens
data5itens