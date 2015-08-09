## Project 1
## Plot 4

## Read Data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset Data
data <- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007") )
dateTime <- paste(data$Date, data$Time)
data1 <- transform(data, fullDate = strptime(dateTime, format =  "%d/%m/%Y %H:%M:%S"))


## Create Plot 4 & Save As .png
par(mfrow = c(2, 2) , mar = c(4, 4, 1, 1))
xrange <- range(data1$fullDate)
yrange <- range(data1$Sub_metering_1)

with(data1, {

  plot(Global_active_power ~ fullDate, data1, type="l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ fullDate, data1, type="l", ylab = "Voltage", xlab = "datetime")
  plot(xrange, yrange,  type="n", ylab = "Energy sub metering", xlab = "")
  lines(data1$fullDate, data1$Sub_metering_1, type="l", col = "black")
  lines(data1$fullDate, data1$Sub_metering_2, type="l", col = "red")
  lines(data1$fullDate, data1$Sub_metering_3, type="l", col = "blue")
  legend("topright", lty = 1, cex=0.8, bty="n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ fullDate, data1, type="l", ylab = "Global_reactive_power", xlab = "datetime")
  }
)

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()