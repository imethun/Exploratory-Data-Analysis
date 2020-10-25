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
png("plot4.png", width = 480,height = 480)
dev.off()
