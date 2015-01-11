## Reading the data from the file household_power_consumption.

## Script Name: plot1.R
## Version: 1.0

x <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                colClasses = c("character", "character", "numeric",
                               "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric"),
                na.strings="?")
## Adding another column DateAndTime to show Date and time in a single column.
x$DateAndTime <- strptime(paste(x$Date, x$Time),
                          "%d/%m/%Y %H:%M:%S")
## subsetting the records .
x <- subset(x, as.Date(DateAndTime) >= as.Date("2007-02-01") &
                as.Date(DateAndTime) <= as.Date("2007-02-02"))
## Opening device plot1.png
png("plot1.png", height=480, width=480)
## generating histogram.
hist(x$Global_active_power, col='red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
## Closing device.
dev.off()
