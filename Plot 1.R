
House_power <- "./household_power_consumption.txt"
HP_data <- read.table(House_power, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
sub_HP_data <-HP_data[HP_data$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(sub_HP_data$Date, sub_HP_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(dateTime)

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(sub_HP_data$Global_active_power)), col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")  
dev.off()