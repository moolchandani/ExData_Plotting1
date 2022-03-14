#Reading, naming and sub-setting the power consumption data for graph creation
powerData <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerData <- subset(powerData,powerData$Date=="1/2/2007" | powerData$Date =="2/2/2007")

# Basic plot function
hist(as.numeric(as.character(subpowerData$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Adding annotation to the graph
title(main="Global Active Power")