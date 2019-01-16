library(magrittr)

# Read data from file and subset for specified dates
data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,
        na.strings="?", stringsAsFactors = FALSE) %>% subset(Date %in% c("1/2/2007","2/2/2007"))

# Create Timestamp variable of class POSIXlt
data$Timestamp <- with(data, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Create plot
with(data, plot(Timestamp, Global_active_power, type="l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))

# Create PNG file
dev.copy(png,'plot2.png')
dev.off()
