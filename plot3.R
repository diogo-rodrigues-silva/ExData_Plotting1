library(lubridate)

filename <- "./household_power_consumption.txt"

df <- read.csv(filename, sep = ";", na.strings = "?")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

selected <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

selected$DateTime <- as.POSIXct(paste(selected$Date, selected$Time))

plot(selected$Sub_metering_1~selected$DateTime,
     type = "l",
     ylab="Energy sub metering",
     xlab="")
lines(selected$Sub_metering_2~selected$DateTime, col='Red')
lines(selected$Sub_metering_3~selected$DateTime, col='Blue')

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()