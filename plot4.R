#get raw data (rd)
rd = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#get work data (rd)
wd = subset(rd, rd$Date == "1/2/2007" | rd$Date == "2/2/2007")

#convert time
wd$TD = as.POSIXct(paste(wd$Date, wd$Time), format="%d/%m/%Y%H:%M:%S")

#make set of 4 plots
png("plot4.png", bg = "transparent")

#initialize set of plots
par(mfrow = c(2,2))

#draw plot 1
plot(wd$TD, wd$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#draw plot 2
plot(wd$TD, wd$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#draw plot 3
plot(wd$TD, wd$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(wd$TD, wd$Sub_metering_2, col = "red", type = "l")
points(wd$TD, wd$Sub_metering_3, col = "blue", type = "l")
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#draw plot 4
plot(wd$TD, wd$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()