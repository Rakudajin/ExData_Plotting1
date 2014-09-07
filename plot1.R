#get raw data (rd)
rd = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#get work data (rd)
wd = subset(rd, rd$Date == "1/2/2007" | rd$Date == "2/2/2007")

#convert time
wd$TD = as.POSIXct(paste(wd$Date, wd$Time), format="%d/%m/%Y%H:%M:%S")

#make plot1
png("plot1.png", bg = "transparent")
hist(wd$Global_active_power, col="Red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", bg=NA)
dev.off()