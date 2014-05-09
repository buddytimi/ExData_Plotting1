library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data[,1:2] <- lapply(1:2, function(x) data[,x] <- as.character(data[,x]))
data[,3:9] <- lapply(3:9, function(x) data[,x] <- as.numeric(data[,x]))
data[,10] <- dmy_hms(paste(data[,1], data[,2]))
names(data)[10] <- "DateTime"


#2
png("plot2.png", 480,480)
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

