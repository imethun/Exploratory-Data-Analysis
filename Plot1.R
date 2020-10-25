# 1st peer review assignment's source code 
# reading the data set 
data<-read.table("./data/household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?",stringsAsFactors = FALSE)
# get acquainted with dataset 
head(data)
str(data)

# covert Date as.date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# subset the data 
subsettedData<-subset(data,(Date==as.Date("2007-2-1")|(Date==as.Date("2007-2-2"))))
str(subsettedData)
table(subsettedData$Date)


# make numeric of global Active power 
subsettedData$Global_active_power<-as.numeric(subsettedData$Global_active_power)

# barplot of Global Active Power 
hist(subsettedData$Global_active_power, col="red",xlab="Global Active Power(killowatts)", main="Global Active Power")

# png file of the graph 
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
