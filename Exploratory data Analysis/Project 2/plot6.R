#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 6

##Note : It is assumed that the data is placed in the working directory.

##All the SCC having the term "Vehicles" in the column EI.Sector are considered as Motor Vehicles.

##Libraries Used
library(plyr)
library(ggplot2)

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
result_6 <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]
motor_vehicle_SCC <- SCC[grep("Vehicles", as.character(SCC$EI.Sector),ignore.case=T),1]
motor_vehicle_SCC <- as.character(motor_vehicle_SCC)
motor_vehicle_row_number <- result_6$SCC %in% motor_vehicle_SCC
result_6 <- result_6[which(motor_vehicle_row_number),]
result_6 <- ddply(result_6,.(fips,year),summarize,Total_Emission = sum(Emissions))
names(result_6) <- c("Counties","year","Total_Emission")
result_6$Counties <- sub("06037","Los Angeles",result_6$Counties)
result_6$Counties <- sub("24510","Baltimore",result_6$Counties)

##Drawing plot 6
png(filename="plot6.png",height=600,width=600)
plot_6 <- qplot(x=year,y=Total_Emission,group=Counties,data=result_6,col=Counties,main="Total annual PM2.5 Emission by Motor Vehicles, Balitmore and Los Angeles",xlab="Year", ylab="Total Emission")
plot_6 + geom_line()
dev.off()
