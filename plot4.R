data <- read.csv("household_power_consumption.txt", sep=";")
d <- data[data$Date %in% c("2/1/2007", "2/2/2007"),]

dt <- strptime(paste(d$Date,d$Time), "%m/%d/%Y %H:%M")


par(mfrow=c(2,2))

# first plot
datap <- cbind("time" = as.double(dt), "Power" = as.double(d$Global_active_power)/1000)
plot(datap,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")

# second plot
datap2 <- cbind("time" = as.double(dt), "Power" = d$Voltage)
plot(datap2,type="l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
axis.POSIXct(1, as.Date.POSIXct(datap2[,1]), format="%m/%d")


# 3rd plot

data1 <- cbind(as.double(dt), d$Sub_metering_1)
data2 <- cbind(as.double(dt), as.double(d$Sub_metering_2)/10)
data3 <- cbind(as.double(dt), d$Sub_metering_3)

plot(data3,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n", col="purple")
axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")
lines(data1, type="l", col = "black")
lines(data2, type="l", col = "red")

# 4rd plot


datap3 <- cbind("time" = as.double(dt), "Power" = as.double(d$Global_reactive_power)/1000)
plot(datap3,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
axis.POSIXct(1, as.Date.POSIXct(datap3[,1]), format="%m/%d")



png("plot4.png")
par(mfrow=c(2,2))
  plot(datap,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
  axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")

  plot(datap2,type="l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
  axis.POSIXct(1, as.Date.POSIXct(datap2[,1]), format="%m/%d")
  
  plot(data3,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n", col="purple")
  axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")
  lines(data1, type="l", col = "black")
  lines(data2, type="l", col = "red")

  plot(datap3,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
  axis.POSIXct(1, as.Date.POSIXct(datap3[,1]), format="%m/%d")


dev.off()