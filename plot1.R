## Coursera: Exploratory Data Analysis
## Assignment 1 - Graph 1

library(lubridate)

## Load data and subset to desired Date range
hpcData <- read.csv("household_power_consumption.txt",sep=";")
hpcData$Date <- dmy(hpcData$Date)
hpcData <- hpcData[hpcData$Date >= as.Date("2007-02-01") & 
        hpcData$Date <= as.Date("2007-02-02"),]


## Graph 1

## Convert columns to numeric
hpcData$Global_active_power <- as.numeric(as.character(hpcData$Global_active_power))

## Plot away
png("plot1.png",width=480,height=480)

hist(hpcData$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()