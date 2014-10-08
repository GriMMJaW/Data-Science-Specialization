#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 1

##Note : It is assumed that the data is placed in the working directory.

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
result_1 <- tapply(NEI$Emissions,NEI$year,FUN=sum)


##A plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
png(filename="plot1.png",height=600,width=600)
plot(result_1,col="blue",type ="l",xaxt="n",main="Total annual PM2.5 Emission from all sources",xlab="Year",ylab="Total PM2.5 Emission")
axis(side=1,at=c(1,2,3,4),labels=c(1999,2002,2005,2008))
dev.off()

