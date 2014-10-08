#Peer Assessment 2 (EXPLORATORY ANALYSIS) PLOT 3

##Note : It is assumed that the data is placed in the working directory.

##Libraries Used
library(plyr)
library(ggplot2)

##Reading the data and data transformation required to perform analysis.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
result_3 <- NEI[NEI$fips=="24510",c(4,5,6)]
result_3 <- ddply(result_3,.(type,year),summarize,Total_Emission = sum(Emissions))

##Drawing plot 3
png(filename="plot3.png",height=600,width=600)
plot_3 <- qplot(x=year,y=Total_Emission,group=type,data=result_3,col=type,main="Total annual PM2.5 Emission, Baltimore City, Maryland",xlab="Year", ylab="Total Emission")
plot_3 + geom_line()
dev.off()



##Alternate method
# EI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# library(ggplot2)
# neibalt=NEI[NEI$fips == "24510",] 
# totalEmisType = aggregate(neibalt$Emissions ~ neibalt$type + neibalt$year, FUN = sum, na.rm = TRUE) totalEmisType$yearChar=as.character(totalEmisType$"neibalt$year") 
# png(file="plot3.png",width = 480 , height = 480 ) 
# ggplot(data = totalEmisType, aes(x = as.character(totalEmisType$"neibalt$year"), y=totalEmisType$"neibalt$Emissions", fill = totalEmisType$"neibalt$type")) + geom_bar(stat="identity")+ scale_fill_hue(name="Type of Emission") + title xlab("Year") + ylab("Total Emissions") + labels ggtitle("Total Emissions by type") 
# dev.off()