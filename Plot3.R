#### Plot 3 ####

## Load the dataset into R 
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Convert dates to date format
DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Plot graph
plot(DateTime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(DateTime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       lwd = 2)

## Copy plot to PNG
dev.copy(png, file = "Plot3.png")
dev.off()