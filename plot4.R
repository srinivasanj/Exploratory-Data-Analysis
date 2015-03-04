# Run script in the folder where the file exists

# Read file using read.table
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Set date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
library(dplyr)
newData <- filter(data,Date>='2007-02-01',Date <= '2007-02-02')

# create a column with date and time together
dateTime <- paste(newData$Date,newData$Time)
newData$dateTime <- as.POSIXct(dateTime)


# plot
par(mfrow=c(2,2))
plot(newData$dateTime, newData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(newData$dateTime, newData$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(newData$dateTime, newData$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(newData$dateTime, newData$Sub_metering_2, type="l", col="red")
lines(newData$dateTime, newData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty='n', col=c("black", "red", "blue"))

plot(newData$dateTime, newData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
