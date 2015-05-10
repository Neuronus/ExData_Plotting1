data <- read.csv("household_power_consumption.txt", sep=";")
d <- data[data$Date %in% c("2/1/2007", "2/2/2007"),]

dt <- strptime(paste(d$Date,d$Time), "%m/%d/%Y %H:%M")
datap <- cbind("time" = as.double(dt), "Power" = as.double(d$Global_active_power)/1000)


plot(datap,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")

png('plot2.png')
  plot(datap,type="l", ylab = "Global Active Power (kilowats)", xlab = "", xaxt = "n")
  axis.POSIXct(1, as.Date.POSIXct(datap[,1]), format="%m/%d")
dev.off()