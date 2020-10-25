# plot 3 
plot(subsettedData$Time,subsettedData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsettedData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# save 
png("plot3.png", width = 480, height = 480)
dev.off()
