##It is assumed that the .txt data file is placed in the working directory before execution.


##Reading the data
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE,sep=";", na.string="?")

##Subsetting the data from 2007-02-01 to 2007-02-02.
mydata$Date <- as.character(mydata$Date)
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")
mydata <- subset(mydata,mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02")
mydata$Date <- format(format(mydata$Date,"%a"))
###View(mydata)

##Drawing plot 4
png("plot4.png", width=480,height=480)
par(mfcol=c(2,2))
###Plot1
with(mydata,plot(x=1:nrow(mydata),y=mydata$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt="n"))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
###Plot2
with(mydata,plot(x=1:nrow(mydata),ylim=range(mydata$Sub_metering_1),type="n",xaxt="n",ylab="Energy sub metering",xlab=""))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
points(x=1:nrow(mydata),y=mydata$Sub_metering_1,col="black",type="l")
points(x=1:nrow(mydata),y=mydata$Sub_metering_2,col="red",type="l")
points(x=1:nrow(mydata),y=mydata$Sub_metering_3,col="blue",type="l")
legend("topright",pch="____",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
###Plot3
with(mydata,plot(y=Voltage,x=1:nrow(mydata),type="l",ylab="Voltage",xlab="datetime",xaxt="n"))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

###Plot4
with(mydata,plot(y=Global_reactive_power,x=1:nrow(mydata),type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n"))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
