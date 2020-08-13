library(lubridate)

filename <- "./household_power_consumption.txt"

df <- read.csv(filename, sep = ";", na.strings = "?")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

selected <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

selected$DateTime <- as.POSIXct(paste(selected$Date, selected$Time))

selected$Global_active_power <- as.numeric(selected$Global_active_power)

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))

# Plot 1
plot(selected$Global_active_power~selected$DateTime,
     type = "l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# Plot 2
plot(selected$Voltage~selected$DateTime,
     type = "l",
     ylab="Voltage",
     xlab="datetime")

# Plot 3
plot(selected$Sub_metering_1~selected$DateTime,
     type = "l",
     ylab="Energy sub metering",
     xlab="")
lines(selected$Sub_metering_2~selected$DateTime, col='Red')
lines(selected$Sub_metering_3~selected$DateTime, col='Blue')

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1, lwd=1, bty="n")

# Plot 4
plot(selected$Global_reactive_power~selected$DateTime,
     type = "l",
     xlab="datetime")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
