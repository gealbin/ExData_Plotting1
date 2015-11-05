#Read the data
power <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date <- as.Date(power$Date,format = "%d/%m/%Y")
power <- power[  power$Date==as.Date("01/02/2007",format="%d/%m/%Y") 
                 | power$Date==as.Date("02/02/2007",format="%d/%m/%Y"), ]
power$datetime <- strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

#Open the device and plot
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
with(power, {
  plot(power$datetime, power$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(power$datetime, power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(datetime, Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "n")
  points(datetime, Sub_metering_1, type = "l" ,col = "black")
  points(datetime, Sub_metering_2, type = "l" ,col = "red")
  points(datetime, Sub_metering_3, type = "l" ,col = "blue")
  legend("topright", pch = c("_","_","_"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(power$datetime, power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()