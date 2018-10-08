suppressMessages(library("dplyr"))

dataTable <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, stringsAsFactors = F)
dataTable <- filter(dataTable, Date %in% c("1/2/2007","2/2/2007"))

dataTable$Global_active_power <- as.numeric(dataTable$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(dataTable$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
