##
##Load required libraries
##
library(datasets)
library(dplyr)

##
##Read/format data
##
energy <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";") %>% 
  transform(DateTime = strptime(paste(Date,Time, sep = " "), format="%d/%m/%Y %H:%M:%S")) %>% 
  select(-Date, -Time) %>% 
  filter(DateTime >= strptime('2007-02-01', format = "%Y-%m-%d"), DateTime < strptime('2007-02-03', format = "%Y-%m-%d"))

##
##Create all plots
##
with(energy, plot(DateTime, as.numeric(as.character(Sub_metering_1)), type = "l",  xlab = "", ylab = "Energy sub metering"))
with(energy, points(DateTime, as.numeric(as.character(Sub_metering_2)), type = "l", col = "red"))
with(energy, points(DateTime, as.numeric(as.character(Sub_metering_3)), type = "l", col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "o", cex = 0.8, x.intersp=0.5, y.intersp=0.5)

##
##Save to PNG file
##
dev.copy(png, file = "plot3.png")
dev.off()
