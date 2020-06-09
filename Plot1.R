#### Plot 1 ####

## Load the dataset into R 
full_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Plot graph
hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")

## Copy plot to PNG
dev.copy(png, file = "Plot1.png")
dev.off()