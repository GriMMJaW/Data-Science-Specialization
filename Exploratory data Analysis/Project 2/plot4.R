#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 4

##Note : It is assumed that the data is placed in the working directory.

##All the SCC having the term "coal" in the column Short.Name are considered as Coal Related Pollutants.

##Libraries used
library(plyr)
library(ggplot2)

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
coal_SCC <- SCC[grep("coal", as.character(SCC$Short.Name),ignore.case=T),1]
coal_SCC <- as.character(coal_SCC)
coal_row_number <- NEI$SCC %in% coal_SCC
result_4 <- NEI[which(coal_row_number),]
result_4 <- tapply(result_4$Emissions,result_4$year,FUN=sum)

##Drawing Plot 4
png(filename="plot4.png",height=600,width=600)
plot(result_4,col="blue",type ="l",xaxt="n",main="Total annual PM2.5 Emission from all coal sources",xlab="Year",ylab="Total PM2.5 Emission")
axis(side=1,at=c(1,2,3,4),labels=c(1999,2002,2005,2008))
dev.off()


