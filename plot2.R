## Project 1
## Plot 2

## Read Data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset Data
data <- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007") )
dateTime <- paste(data$Date, data$Time)
data1 <- transform(data, fullDate = strptime(dateTime, format =  "%d/%m/%Y %H:%M:%S"))


## Create Plot 2 & Save As .png
with(data1,  plot(Global_active_power ~ fullDate, data1, type="l", ylab = "Global Active Power (kilowatts)", xlab = "") )
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

