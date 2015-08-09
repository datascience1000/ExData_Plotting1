## Project 1
## Plot 1

## Read Data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset Data
data <- subset(rawdata, rawdata$Date %in% c("1/2/2007","2/2/2007") )

## Create Plot 1 & Save As .png
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


