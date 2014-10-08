#1] "" "15"
data <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Quiz1_AmericanCommunity.csv", header = TRUE)



#2] 377652.4
mydata <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-GDP.csv",header = TRUE)
mydata <- mydata[1:190,]

#3]grep("^United",countryNames), 3
mydata <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-GDP.csv",header = TRUE)
mydata <- mydata[1:190]

#4] 16
library(plyr)
mydata1 <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-GDP.csv",header = TRUE)
mydata2 <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-EDSTATS_Country.csv",header = TRUE,)
mydata3 <- join(mydata1,mydata2)
length(grep(pattern = "June",as.character(mydata3$Special.Notes)))

#5] 250, 47
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 



