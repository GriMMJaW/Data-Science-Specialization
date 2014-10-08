#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 5

##Note : It is assumed that the data is placed in the working directory.

##All the SCC having the term "Vehicles" in the column EI.Sector are considered as Motor Vehicles.

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
result_5 <- NEI[NEI$fips=="24510",]
motor_vehicle_SCC <- SCC[grep("Vehicles", as.character(SCC$EI.Sector),ignore.case=T),1]
motor_vehicle_SCC <- as.character(motor_vehicle_SCC)
motor_vehicle_row_number <- result_5$SCC %in% motor_vehicle_SCC
result_5 <- result_5[which(motor_vehicle_row_number),]
result_5 <- tapply(result_5$Emissions,result_5$year,FUN=sum)

##Drawing Plot 5
png(filename="plot5.png",height=600,width=600)
par(bg="gray",col.axis="black",col="black",col.lab="black",col.main="black", col.sub="black")
plot(result_5,type ="l",col="slateblue3",xaxt="n",main="Total annual PM2.5 Emission from motor vehicles. Baltimore City",xlab="Year",ylab="Total PM2.5 Emission")
axis(side=1,at=c(1,2,3,4),labels=c(1999,2002,2005,2008))
dev.off()
