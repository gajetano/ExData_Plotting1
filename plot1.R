library(magrittr)

# Read data from file and subset for specified dates
data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,
        na.strings="?", stringsAsFactors = FALSE) %>% subset(Date %in% c("1/2/2007","2/2/2007"))

# Create histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Create PNG file
dev.copy(png,'plot1.png')
dev.off()
