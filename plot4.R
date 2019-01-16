library(magrittr)

# Read data from file and subset for specified dates
data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,
        na.strings="?", stringsAsFactors = FALSE) %>% subset(Date %in% c("1/2/2007","2/2/2007"))

# Create Timestamp variable of class POSIXlt
data$Timestamp <- with(data, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Create plots
par(mfrow=c(2,2))
with(data, {
    plot(Timestamp, Global_active_power, type="l", xlab = "",
         ylab = "Global Active Power (kilowatts)")
    plot(Timestamp, Voltage, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Timestamp, Sub_metering_1, type="l",
            ylab="Energy sub metering", xlab="")
        lines(Timestamp, Sub_metering_2,col='Red')
        lines(Timestamp, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Timestamp, Global_reactive_power, type="l", 
        ylab="Global Reactive Power (kilowatts)",xlab="")
})

# Create PNG file
dev.copy(png,'plot4.png')
dev.off()
