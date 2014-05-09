library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data[,1:2] <- lapply(1:2, function(x) data[,x] <- as.character(data[,x]))
data[,3:9] <- lapply(3:9, function(x) data[,x] <- as.numeric(data[,x]))
data[,10] <- dmy_hms(paste(data[,1], data[,2]))
names(data)[10] <- "DateTime"

#3
png("plot3.png", 480,480)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
