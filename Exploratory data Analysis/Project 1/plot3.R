##It is assumed that the .txt data file is placed in the working directory before execution.

##Reading the data
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE,sep=";", na.string="?")

##Subsetting the data from 2007-02-01 to 2007-02-02.
mydata$Date <- as.character(mydata$Date)
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")
mydata <- subset(mydata,mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02")
mydata$Date <- format(format(mydata$Date,"%a"))
###View(mydata)

##Drawing the plot3
###To check which of the three sub_metering reading has the maximum spread so that the y-axis range can be adjusted according to that.
sapply(mydata[,c(7,8,9)],max)
###Drawing the plot in a .png file extension.
png("plot3.png",width=480,height=480)
with(mydata,plot(x=1:nrow(mydata),ylim=range(mydata$Sub_metering_1),type="n",xaxt="n",ylab="Energy sub metering",xlab=""))
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
points(x=1:nrow(mydata),y=mydata$Sub_metering_1,col="black",type="l")
points(x=1:nrow(mydata),y=mydata$Sub_metering_2,col="red",type="l")
points(x=1:nrow(mydata),y=mydata$Sub_metering_3,col="blue",type="l")
legend("topright",pch="_",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

