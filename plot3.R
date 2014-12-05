#load data
data<-read.csv("./household_power_consumption.txt",header=T,sep=";",na.strings="?")
Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Date<-Date

#get subset 
subdata<-subset(data,subset=c(Date>="2007-02-01"&Date<="2007-02-02"))

#convert Date and Time variables
datetime<-paste(as.Date(subdata$Date),subdata$Time)
subdata$datetime<-as.POSIXct(datetime)

#plot
par(mrow=c(1,1))
png("plot3.png",height=480,width=480)
with(subdata, {
  plot(Sub_metering_1~subdata$datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~subdata$datetime,col='Red')
  lines(Sub_metering_3~subdata$datetime,col='Blue')
})
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2)

#save plot to a PNG file
dev.off()
