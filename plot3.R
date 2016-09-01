## Coursera: Exploratory Data Analysis
## Assignment 1 - Graph 2

library(lubridate)

## Load data and subset to desired Date range
hpcData <- read.csv("household_power_consumption.txt",sep=";")
hpcData$Time <- dmy_hms(paste(hpcData$Date,hpcData$Time))
hpcData$Date <- dmy(hpcData$Date)
hpcData <- hpcData[hpcData$Date >= as.Date("2007-02-01") & 
        hpcData$Date <= as.Date("2007-02-02"),]

## Graph 3

## Convert columns to numeric
hpcData$Sub_metering_1 <- as.numeric(as.character(hpcData$Sub_metering_1))
hpcData$Sub_metering_2 <- as.numeric(as.character(hpcData$Sub_metering_2))
hpcData$Sub_metering_3 <- as.numeric(as.character(hpcData$Sub_metering_3))

## Plot away
png("plot3.png",width=480,height=480)

plot(hpcData$Time,hpcData$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(hpcData$Time,y=hpcData$Sub_metering_2,col="red")
lines(hpcData$Time,y=hpcData$Sub_metering_3,col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)


dev.off()