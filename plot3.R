#Read the data
power <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date <- as.Date(power$Date,format = "%d/%m/%Y")
power <- power[  power$Date==as.Date("01/02/2007",format="%d/%m/%Y") 
              | power$Date==as.Date("02/02/2007",format="%d/%m/%Y"), ]
power$DateTime <- strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

#Open the device and plot
png(filename = "plot3.png",width = 480, height = 480)
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "n"))
with(power, points(DateTime, Sub_metering_1, type = "l" ,col = "black"))
with(power, points(DateTime, Sub_metering_2, type = "l" ,col = "red"))
with(power, points(DateTime, Sub_metering_3, type = "l" ,col = "blue"))
legend("topright", pch = c("_","_","_"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()