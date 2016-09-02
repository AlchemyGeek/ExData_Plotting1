## Coursera: Exploratory Data Analysis
## Assignment 1 - Graph 4

library(lubridate)

## Load data and subset to desired Date range
hpcData <- read.csv("household_power_consumption.txt",sep=";",
                    stringsAsFactors = FALSE)
hpcData$Time <- dmy_hms(paste(hpcData$Date,hpcData$Time))
hpcData$Date <- dmy(hpcData$Date)
hpcData <- hpcData[hpcData$Date >= as.Date("2007-02-01") & 
        hpcData$Date <= as.Date("2007-02-02"),]

## Graph 4

## Convert columns to numeric
hpcData$Sub_metering_1 <- as.numeric(hpcData$Sub_metering_1)
hpcData$Sub_metering_2 <- as.numeric(hpcData$Sub_metering_2)
hpcData$Sub_metering_3 <- as.numeric(hpcData$Sub_metering_3)
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)
hpcData$Voltage <- as.numeric(hpcData$Voltage)
hpcData$Global_reactive_power <- as.numeric(hpcData$Global_reactive_power)

## Plot away
png("plot4.png",width=480,height=480)

## Create 2 x 2 canvas for plots
par(mfrow = c(2,2))

# Plot 1/4

plot(hpcData$Time,hpcData$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (killowatts)")

# Plot 2/4
plot(hpcData$Time,hpcData$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

# Plot 3/4
plot(hpcData$Time,hpcData$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(hpcData$Time,y=hpcData$Sub_metering_2,col="red")
lines(hpcData$Time,y=hpcData$Sub_metering_3,col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)

# Plot 4/4
plot(hpcData$Time,hpcData$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()
par(mfrow = c(1,1))