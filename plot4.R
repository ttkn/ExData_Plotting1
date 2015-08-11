setwd("c:/users/pearl/documents/github/eda/exdata_plotting1")
library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c("factor","factor", rep("numeric",7)))
df$Date <- as.Date(as.character(df$Date), format = "%d/%m/%Y")
FebData <- filter(df, Date >= "2007-02-01", Date <= "2007-02-02")

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

#panel 1
plot(FebData$Global_active_power, xaxt="n", type = "l", 
     xlab = "", ylab= "Global Active Power (kilowatts)")
axis(side = 1, at = c(1, 1440, 2880), tick = TRUE, c("thur.", "fri.", "sat."))

#panel 2
submeter1 <- FebData$Sub_metering_1
submeter2 <- FebData$Sub_metering_2
submeter3 <- FebData$Sub_metering_3

plot(submeter1, xaxt = "n", ylab = "Energy sub metering", xlab = "", type = "l")
lines(submeter2, col = "red")
lines(submeter3, col = "blue")
axis(side = 1, at = c(1, 1440, 2880), tick = TRUE, c("thur.", "fri.", "sat."))
legend("topright",legend = c("Submetering 1", "Submetering 2", "Submetering 3"),
       col = c("black", "red", "blue"), pch = "-")

#panel 3
plot(FebData$Voltage, xaxt = "n", ylab = "Voltage", xlab = "datetime", type = "l")
axis(side = 1, at = c(1, 1440, 2880), tick = TRUE, c("thur.", "fri.", "sat."))

#panel 4
plot(FebData$Global_reactive_power, xaxt = "n", ylab = "Global Reactive Power", xlab = "datetime", type = "l")
axis(side = 1, at = c(1, 1440, 2880), tick = TRUE, c("thur.", "fri.", "sat."))
dev.off()
