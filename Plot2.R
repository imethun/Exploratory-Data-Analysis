# add date and time 
subsettedData$Time <- strptime(subsettedData$Time, format="%H:%M:%S")
subsettedData[1:1440,"Time"] <- format(subsettedData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsettedData[1441:2880,"Time"] <- format(subsettedData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

subsettedData$datetime<-strptime(paste(subsettedData$Date,subsettedData$Time,sep=""),"%d/%m/%Y %H:%M:%S")
datetime <- strptime(paste(subsettedData$Date, subsettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(subsettedData$Time,as.numeric(as.character(subsettedData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
title(main = "Global active Power vs time ")
dev.off()
