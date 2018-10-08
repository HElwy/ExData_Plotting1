suppressMessages(library("dplyr"))

dataTable <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, stringsAsFactors = F)
dataTable <- filter(dataTable, Date %in% c("1/2/2007","2/2/2007"))

dataTable$Sub_metering_1 <- as.numeric(dataTable$Sub_metering_1)
dataTable$Sub_metering_2 <- as.numeric(dataTable$Sub_metering_2)
dataTable$Sub_metering_3 <- as.numeric(dataTable$Sub_metering_3)
dataTable$datetime <- strptime(paste(dataTable$Date, dataTable$Time), 
                               "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(dataTable$datetime, dataTable$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy Submetering")
lines(dataTable$datetime, dataTable$Sub_metering_2, type = "l", col = "red")
lines(dataTable$datetime, dataTable$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.off()
