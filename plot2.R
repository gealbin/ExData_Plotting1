#Read the data
power <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date <- as.Date(power$Date,format = "%d/%m/%Y")
power <- power[  power$Date==as.Date("01/02/2007",format="%d/%m/%Y") 
              | power$Date==as.Date("02/02/2007",format="%d/%m/%Y"), ]
power$DateTime <- strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

#Open the device and plot
png(filename = "plot2.png",width = 480, height = 480)
plot(power$DateTime,power$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()