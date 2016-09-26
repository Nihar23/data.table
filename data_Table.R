#data.table tutorial
library(data.table)

#create a data table
dt=data.table(ID=1:20, age=sample(10:50,size=20,replace=F),sector=rep(c("Agriculture","Education","Service","Sports"),20))

#simple command to get average age per sector
dt[,mean(age),sector]

#reading csv files
train=fread("training_data.csv")

#subsetting rows
subrows=dt[age>20 & sector=="Service"]

#subsetting columns
subcols=dt[,.(age)]
subcols=dt[,.(sector)]

#add a new column
dt[,new:= age*10]

#update row values
dt[sector=="Agriculture",sector:="Agr"]

#delete a column
dt[,c(sector):=NULL]

#compute average on basis of sector
dt[,.(average=mean(age)),by=sector]

#compute the count
dt[,.N,by=age]

#Setting a key
setkey(dt,age)

#Conditional opertions in data.table
train[,income_level := ifelse(income_level == "-50000",0,1)]
