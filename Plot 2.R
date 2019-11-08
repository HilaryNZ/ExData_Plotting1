House_power <- "./household_power_consumption.txt"
HP_data <- read.table(House_power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
sub_HP_data <-HP_data[HP_data$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(sub_HP_data$Date, sub_HP_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(dateTime)

gAP <- as.numeric(sub_HP_data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(House_power_DT, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()