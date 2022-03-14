#Reading, naming and sub-setting the power consumption data for graph creation
powerData <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerData <- subset(powerData,powerData$Date=="1/2/2007" | powerData$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpowerData$Date <- as.Date(subpowerData$Date, format="%d/%m/%Y")
subpowerData$Time <- strptime(subpowerData$Time, format="%H:%M:%S")
subpowerData[1:1440,"Time"] <- format(subpowerData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerData[1441:2880,"Time"] <- format(subpowerData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpowerData,{
  plot(subpowerData$Time,as.numeric(as.character(subpowerData$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpowerData$Time,as.numeric(as.character(subpowerData$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpowerData$Time,subpowerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpowerData,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpowerData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpowerData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpowerData$Time,as.numeric(as.character(subpowerData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

