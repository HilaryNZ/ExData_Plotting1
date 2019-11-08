House_power <- "./household_power_consumption.txt"
HP_data <- read.table(House_power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
sub_HP_data <-HP_data[HP_data$Date %in% c("1/2/2007","2/2/2007") ,]
head(sub_HP_data)
dateTime <- strptime(paste(sub_HP_data$Date, sub_HP_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(dateTime)

sub_metering_1 <- as.numeric(sub_HP_data$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_HP_data$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_HP_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateTime, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, sub_metering_2, type="l", col = "red")
lines(dateTime, sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()