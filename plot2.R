#### Reading the data from the file household_power_consumption.txt.

## Script Name: plot2.R
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
x <- subset(x,
            as.Date(DateAndTime) >= as.Date("2007-02-01") &
                as.Date(DateAndTime) <= as.Date("2007-02-02"))
## Opening device plot2.png
png("plot2.png", height=480, width=480)
## generating plot.
with(x,plot(DateAndTime,Global_active_power,pch=NA,xlab="", ylab="Global Active Power (kilowatts)"))
with(x,lines(DateAndTime,Global_active_power))
## Closing device.
dev.off()
