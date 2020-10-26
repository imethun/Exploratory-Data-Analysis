# reading the data set 
data<-read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?",stringsAsFactors = FALSE)
# get acquainted with dataset 
head(data)
str(data)

# covert Date as.date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# subset the data 
subsettedData<-subset(data,(Date==as.Date("2007-2-1")|(Date==as.Date("2007-2-2"))))

# create the time variable 
subsettedData$Time <- strptime(subsettedData$Time, format="%H:%M:%S")
subsettedData[1:1440,"Time"] <- format(subsettedData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsettedData[1441:2880,"Time"] <- format(subsettedData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# set the appearance 
par(mfrow=c(2,2))

# add the first plot
plot(subsettedData$Time,as.numeric(as.character(subsettedData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
# add the second plot 
plot(subsettedData$Time,as.numeric(as.character(subsettedData$Voltage)), type="l",xlab="datetime",ylab="Voltage")
# add third plot
plot(subsettedData$Time,subsettedData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))

legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=0.5)

#  add the fourth plot
plot(subsettedData$Time,as.numeric(as.character(subsettedData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
