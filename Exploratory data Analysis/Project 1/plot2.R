##It is assumed that the .txt data file is placed in the working directory before execution.

##Reading the data
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE,sep=";", na.string="?")

##Subsetting the data from 2007-02-01 to 2007-02-02.
mydata$Date <- as.character(mydata$Date)
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")
mydata <- subset(mydata,mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02")
mydata$Date <- format(format(mydata$Date,"%a"))
###View(mydata)

## Drawing plot2
png("plot2.png", width=480,height=480)
with(mydata,plot(x=1:nrow(mydata),y=mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n"))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()

