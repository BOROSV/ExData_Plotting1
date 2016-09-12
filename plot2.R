CompleteDataset <- read.table("./download/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE) 
Data <-subset(CompleteDataset, Date =="1/2/2007" | Date =="2/2/2007")
DT <- strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")  
Data$Global_active_power <- as.numeric(Data$Global_active_power) 
png("plot2.png", width=480, height=480)
plot(DT, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 


