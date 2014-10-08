#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 2

##Note : It is assumed that the data is placed in the working directory.

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
result_2 <- NEI[NEI$fips=="24510",]
result_2 <- tapply(result_2$Emissions,result_2$year,sum)

##Libraries Used
library(RColorBrewer)

##2] Plotting the data
png(filename="plot2.png",height=600,width=600)
color <- brewer.pal(4,"Set1")
par(col.axis="black",col.lab="black",col.main="black")
plot(result_2,col=color,type ="l",xaxt="n",main="Total annual PM2.5 Emission, Baltimore City, Maryland",xlab="Year",ylab="Total PM2.5 Emission")
axis(side=1,at=c(1,2,3,4),labels=c(1999,2002,2005,2008))
dev.off()
