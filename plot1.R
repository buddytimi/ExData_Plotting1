library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header=T)
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data[,1:2] <- lapply(1:2, function(x) data[,x] <- as.character(data[,x]))
data[,3:9] <- lapply(3:9, function(x) data[,x] <- as.numeric(data[,x]))
data[,10] <- dmy_hms(paste(data[,1], data[,2]))
names(data)[10] <- "DateTime"

#1
windows(480,480)
hist(data$Global_active_power/500, col="orangered2", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

