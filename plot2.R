library(lubridate)

filename <- "./household_power_consumption.txt"

df <- read.csv(filename, sep = ";", na.strings = "?")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

selected <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

selected$DateTime <- as.POSIXct(paste(selected$Date, selected$Time))

selected$Global_active_power <- as.numeric(selected$Global_active_power)

plot(selected$Global_active_power~selected$DateTime,
     type = "l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
