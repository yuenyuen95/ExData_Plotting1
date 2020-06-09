#### Plot 4 ####

## Load the dataset into R 
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Convert dates to date format
DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Set parameter for 2 x 2 plots
par(mfrow = c(2,2))
par(cex.lab = 0.9)

# Plot first graph
plot(DateTime, as.numeric(data$Global_active_power), 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")

# Plot second graph
plot(DateTime, as.numeric(data$Voltage), 
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

# Plot third graph
plot(DateTime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(DateTime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       lwd = 2,
       bty = "n",
       cex = 0.6)

# Plot fourth graph
plot(DateTime, as.numeric(data$Global_reactive_power), 
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Copy plot to PNG
dev.copy(png, file = "Plot4.png")
dev.off()