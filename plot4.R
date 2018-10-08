suppressMessages(library("dplyr"))

dataTable <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, stringsAsFactors = F)
dataTable <- filter(dataTable, Date %in% c("1/2/2007","2/2/2007"))
x <- dataTable
dataTable <- x

dataTable$Global_active_power <- as.numeric(dataTable$Global_active_power)
dataTable$Global_reactive_power <- as.numeric(dataTable$Global_reactive_power)
dataTable$Sub_metering_1 <- as.numeric(dataTable$Sub_metering_1)
dataTable$Sub_metering_2 <- as.numeric(dataTable$Sub_metering_2)
dataTable$Sub_metering_3 <- as.numeric(dataTable$Sub_metering_3)
dataTable$Voltage <- as.numeric(dataTable$Voltage)
dataTable$datetime <- strptime(paste(dataTable$Date, dataTable$Time), 
                               "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot Top Left
plot(dataTable$datetime, dataTable$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Plot Top Right
plot(dataTable$datetime, dataTable$Voltage, type="l", 
     xlab = "datetime", ylab = "Voltage")

# Plot Bottom Left
plot(dataTable$datetime, dataTable$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy Submetering")
lines(dataTable$datetime, dataTable$Sub_metering_2, type = "l", col = "red")
lines(dataTable$datetime, dataTable$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex = 0.5, bty = "n")

# Plot Bottom Right
plot(dataTable$datetim, dataTable$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()