##It is assumed that the .txt data file is placed in the working directory before execution.

##Reading the data
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE,sep=";", na.string="?")

##Subsetting the data from 2007-02-01 to 2007-02-02.
mydata$Date <- as.character(mydata$Date)
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")
mydata <- subset(mydata,mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02")
View(mydata)

##Drawing plot 1
png("plot1.png",width = 480, height = 480)
hist(mydata$Global_active_power,xlab ="Global Active Power (kilowatts)", ylab="Frequency", col="red",main="Global Active Power")
dev.off()
