#### Reading the data from the file household_power_consumption.txt.

## Script Name: plot4.R
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
x <- subset(x,as.Date(DateAndTime) >= as.Date("2007-02-01") &
                as.Date(DateAndTime) <= as.Date("2007-02-02"))
## Opening device plot4.png
png("plot4.png", height=480, width=480)
## to generate 4 plots in a single device..changing the dimension.
par(mfrow=c(2,2))
##generating 1st plot.
with(x,plot(DateAndTime, Global_active_power,pch=NA,xlab="",ylab="Global Active Power"))
with(x,lines(DateAndTime, Global_active_power))
## generating 2nd plot.
with(x,plot(DateAndTime, Voltage, ylab="Voltage", xlab="datetime", pch=NA))
with(x,lines(DateAndTime, Voltage))
##generating 3rd plot.
with(x,plot(DateAndTime,Sub_metering_1, pch=NA,xlab="",ylab="Energy sub metering"))
with(x,lines(DateAndTime, Sub_metering_1))
with(x,lines(DateAndTime, Sub_metering_2, col="red"))
with(x,lines(DateAndTime, x$Sub_metering_3, col='blue'))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
)
##generating 4th plot.
with(x,plot(DateAndTime, Global_reactive_power, xlab='datetime', pch=NA))
with(x,lines(DateAndTime, Global_reactive_power))
## Closing device.
dev.off()