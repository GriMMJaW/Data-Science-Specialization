data <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Quiz1_AmericanCommunity.csv", header = TRUE)
View(data)
library(data.table)
dt <- data.table(data)
View(dt)


install.packages("xlsx")
library(xlsx)
help(xlsx)
dat <- read.xlsx("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Quiz1_NaturalGas.xlsx", sheetIndex =1,header = TRUE,rowIndex = 18:23,colIndex = 7:15)
View(dat)
sum(dat$Zip*dat$Ext,na.rm=TRUE)




#For reading the number of restaurents with zip code 21231
install.packages("XML")
library(XML)
dat <- xmlTreeParse("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Quiz1_Restaurents.xml", useInternal = TRUE)
count = 0L
for(i in 1:length(names(rootNode[[1]])))
{
  if(as.integer(xmlValue(rootNode[[1]][[i]][[2]])) == 21231)
  {
    count = count + 1
  }
}

library(help = data.table)
help(fread)
DT <- fread(input = "/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Quiz1_Housing.csv")
