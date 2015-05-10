data <- read.csv("household_power_consumption.txt", sep=";")
d <- data[data$Date %in% c("2/1/2007", "2/2/2007"),]

dt <- strptime(paste(d$Date,d$Time), "%m/%d/%Y %H:%M")
data1 <- cbind(as.double(dt), d$Sub_metering_1)
data2 <- cbind(as.double(dt), as.double(d$Sub_metering_2)/10)
data3 <- cbind(as.double(dt), d$Sub_metering_3)

plot(data3,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n", col="purple")
axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")
lines(data1, type="l", col = "black")
lines(data2, type="l", col = "red")


png('plot3.png')
  plot(datap,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
  axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")
dev.off()