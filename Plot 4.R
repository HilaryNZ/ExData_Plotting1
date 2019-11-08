House_power <- "./household_power_consumption.txt"
HP_data <- read.table(House_power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
sub_HP_data <-HP_data[HP_data$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(sub_HP_data$Date, sub_HP_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(dateTime)

gAP <- as.numeric(sub_HP_data$Global_active_power)
voltage <- as.numeric(sub_HP_data$Voltage)
gRP <- as.numeric(sub_HP_data$Global_reactive_power)
sub_metering_1 <- as.numeric(sub_HP_data$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_HP_data$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_HP_data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dateTime, gAP, type="l", xlab="", ylab="Global Active Power")

plot(dateTime, voltage, type="l", xlab="", ylab="Voltage")

plot(dateTime, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, sub_metering_2, type="l", col = "red")
lines(dateTime, sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", lty = 1)

plot(dateTime, gRP, type="l", xlab="", ylab="Global_reactive_power")
dev.off()