data <- read.csv("household_power_consumption.txt", sep=";")
d <- data[data$Date %in% c("2/2/2007", "2/1/2007"),]


hist(as.double(d$Global_active_power), col="red", breaks=10, main="Global Active Power", xlab="Global active power (kilowatts)", lwd=2)

png('plot1.png')
hist(as.double(d$Global_active_power), col="red", breaks=10, main="Global Active Power", xlab="Global active power (kilowatts)", lwd=2)
dev.off()



