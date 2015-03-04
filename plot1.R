# Run script in the folder where the file exists

# Read file using read.table
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";",stringsAsFactors=FALSE)

# Set date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
library(dplyr)
newData <- filter(data,Date>='2007-02-01',Date <= '2007-02-02')
# Convert to numeric
newData$Global_active_power <- as.numeric(newData$Global_active_power)

#plot graph
hist(newData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
