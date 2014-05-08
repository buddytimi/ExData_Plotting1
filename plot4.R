library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header=T)
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data[,1:2] <- lapply(1:2, function(x) data[,x] <- as.character(data[,x]))
data[,3:9] <- lapply(3:9, function(x) data[,x] <- as.numeric(data[,x]))
data[,10] <- dmy_hms(paste(data[,1], data[,2]))
names(data)[10] <- "DateTime"

#4
windows(480,480)
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$DateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l",  ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file="plot4.png")
dev.off()