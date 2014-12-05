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
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))
  with(subdata,{
    plot(Global_active_power~subdata$datetime,type="l"
         ,ylab="Global Active Power (kilowatts)",xlab="")
    plot(Voltage~subdata$datetime, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~subdata$datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~subdata$datetime,col="Red",type="l")
  lines(Sub_metering_3~subdata$datetime,col="Blue",type="l")
  legend("topright",col=c("black", "red", "blue"),bty="n",lwd=par("lwd"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 plot(Global_reactive_power~subdata$datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


## Saving to file
dev.off()
