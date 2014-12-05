#load data
data<-read.csv("./household_power_consumption.txt",header=T,sep=";",na.strings="?")
Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Date<-Date

#get subset 
subdata<-subset(data,subset=c(Date>="2007-02-01"&Date<="2007-02-02"))

#convert Date and Time variables
datetime<-paste(as.Date(subdata$Date),subdate$Time)
subdata$datetime<-as.POSIXct(datetime)

#plot
plot(subdata$Global_active_power~subdata$datetime,col="black",ylab="Global Active Power (kilowatts)",xlab="",type="l")

#save plot to a PNG file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
