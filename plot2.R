#get raw data (rd)
rd = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#get work data (rd)
wd = subset(rd, rd$Date == "1/2/2007" | rd$Date == "2/2/2007")

#convert time
wd$TD = as.POSIXct(paste(wd$Date, wd$Time), format="%d/%m/%Y%H:%M:%S")

#make plot2
png("plot2.png", bg = "transparent")
plot(wd$TD, wd$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()