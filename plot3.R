## Project 1
## Plot 3

## Read Data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset Data
data <- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007") )
dateTime <- paste(data$Date, data$Time)
data1 <- transform(data, fullDate = strptime(dateTime, format =  "%d/%m/%Y %H:%M:%S"))


## Create Plot 3 & Save As .png
xrange <- range(data1$fullDate)
yrange <- range(data1$Sub_metering_1)
plot(xrange, yrange,  type="n", ylab = "Energy sub metering", xlab = "")
lines(data1$fullDate, data1$Sub_metering_1, type="l", col = "black")
lines(data1$fullDate, data1$Sub_metering_2, type="l", col = "red")
lines(data1$fullDate, data1$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

