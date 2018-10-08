suppressMessages(library("dplyr"))

dataTable <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, stringsAsFactors = F)
dataTable <- filter(dataTable, Date %in% c("1/2/2007","2/2/2007"))

dataTable$Global_active_power <- as.numeric(dataTable$Global_active_power)
dataTable$datetime <- strptime(paste(dataTable$Date, dataTable$Time), 
                               "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(dataTable$datetime, dataTable$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
