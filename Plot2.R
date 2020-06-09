#### Plot 2 ####

## Load the dataset into R 
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Convert dates to date format
DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Plot graph 
plot(DateTime, as.numeric(data$Global_active_power), 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Copy plot to PNG
dev.copy(png, file = "Plot2.png")
dev.off()