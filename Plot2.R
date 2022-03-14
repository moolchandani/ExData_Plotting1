# R#Reading, naming and sub-setting the power consumption data for graph creation
powerData <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerData <- subset(powerData,powerData$Date=="1/2/2007" | powerData$Date =="2/2/2007")

# Transforming the Date and Time variables from characters into objects of type Date and POSIXlt respectively
subpowerData$Date <- as.Date(subpowerData$Date, format="%d/%m/%Y")
subpowerData$Time <- strptime(subpowerData$Time, format="%H:%M:%S")
subpowerData[1:1440,"Time"] <- format(subpowerData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerData[1441:2880,"Time"] <- format(subpowerData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Basic plot function
plot(subpowerData$Time,as.numeric(as.character(subpowerData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Adding annotation to the graph
title(main="Global Active Power Vs Time")