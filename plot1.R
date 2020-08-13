filename <- "./household_power_consumption.txt"

df <- read.csv(filename, sep = ";")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

selected <- subset(df, Date >= as.Date("2007-02-01") &  Date <= as.Date("2007-02-02"))

selected$Global_active_power <- as.numeric(selected$Global_active_power)

par(mfrow = c(1, 1))
    
hist(selected$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()