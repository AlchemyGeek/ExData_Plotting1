## Coursera: Exploratory Data Analysis
## Assignment 1 - Graph 2

library(lubridate)

## Load data and subset to desired Date range
hpcData <- read.csv("household_power_consumption.txt",sep=";",
                    stringsAsFactors = FALSE)
hpcData$Time <- dmy_hms(paste(hpcData$Date,hpcData$Time))
hpcData$Date <- dmy(hpcData$Date)
hpcData <- hpcData[hpcData$Date >= as.Date("2007-02-01") & 
        hpcData$Date <= as.Date("2007-02-02"),]

## Graph 2

## Convert columns to numeric
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)

## Plot away
png("plot2.png",width=480,height=480)

plot(hpcData$Time,hpcData$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (killowatts)")

dev.off()