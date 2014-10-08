

mydata <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-ss06hid.csv",header = TRUE)

View(mydata)


#Question 1 
#ACR, AGS #125,238,262
View(mydata[which(mydata$ACR == 3 & mydata$AGS==6),])


#Question 2
#-15259150 -10575416
mydata <- readJPEG("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-jeff.jpg", native = TRUE)
quantile(mydata, probs = seq(0,1,0.1))


#Question 3
#189, KNA
mydata1 <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-GDP.csv",header = TRUE)
mydata1 <- mydata1[1:190,]
mydata2 <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz3/getdata-data-EDSTATS_Country.csv",header = TRUE,)
mydata3 <- join(mydata1,mydata2)
View(mydata3)
View(mydata3[order(mydata3$Ranking,decreasing = TRUE),])

#Question 4
#32.96667, 91.91304
mean(mydata3[which(mydata3$Income.Group == "High income: OECD"),2], na.rm=TRUE )
mean(mydata3[which(mydata3$Income.Group == "High income: nonOECD"),2], na.rm=TRUE )

#Question 5
#5
mydata4 <- mydata3
mydata4<- mutate(mydata4,RankingsGroup = cut2(Ranking,g=5))
View(mydata4[which(mydata4$Ranking <=38 & mydata4$Income.Group == "Lower middle income"),])
