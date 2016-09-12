CompleteDataset <- read.table("./download/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE) 
Data <-subset(CompleteDataset, Date =="1/2/2007" | Date =="2/2/2007")
DT <- strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")  

Data$Global_active_power <- as.numeric(Data$Global_active_power) 

Data$Voltage <- as.numeric(Data$Voltage) 

Data$Sub_metering_1 <- as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2 <- as.numeric(Data$Sub_metering_2)
Data$Sub_metering_3 <- as.numeric(Data$Sub_metering_3)

Data$Global_reactive_power <- as.numeric(Data$Global_reactive_power)
                                         
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(DT, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power") 

plot(DT, Data$Voltage, type="l", xlab="datetime", ylab="Voltage") 

plot(DT, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DT,Data$Sub_metering_2, type="l", xlab="", ylab="", col="red")
lines(DT,Data$Sub_metering_3, type="l", xlab="", ylab="", col="blue")
legend(x="topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")
plot(DT, Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
