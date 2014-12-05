#load data
data<-read.csv("./household_power_consumption.txt",header=T,sep=";",na.strings="?")
Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Date<-Date

#get subset 
subdata<-subset(data,subset=c(Date>="2007-02-01"&Date<="2007-02-02"))

#convert Date and Time variables
datatime<-paste(as.Date(subdata$Date),subdata$Time)
subdata$datatime<-as.POSIXct(datatime)

#plot
hist(subdata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#save plot to a PNG file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
