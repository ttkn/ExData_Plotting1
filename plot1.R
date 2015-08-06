setwd("c:/users/pearl/documents/github/eda/exdata_plotting1")
library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c("factor","factor", rep("numeric",7)))
df$Date <- as.Date(as.character(df$Date), format = "%d/%m/%Y")
FebData <- filter(df, Date >= "2007-02-01", Date <= "2007-02-02")

png(filename = "plot1.png", width = 480, height = 480)
with(FebData, hist(FebData$Global_active_power, breaks = 15, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
