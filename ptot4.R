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
par(mfrow = c(2, 2))

with(energy, {
  plot(DateTime, as.numeric(as.character(Global_active_power)), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  plot(DateTime, as.numeric(as.character(Voltage)), xlab = "datetime", ylab = "Voltage", type = "l")
  plot(DateTime, as.numeric(as.character(Sub_metering_1)), type = "l",  xlab = "", ylab = "Energy sub metering")
  points(DateTime, as.numeric(as.character(Sub_metering_2)), type = "l", col = "red")
  points(DateTime, as.numeric(as.character(Sub_metering_3)), type = "l", col = "blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.5, inset = c(-0.3, -0.1), x.intersp=0.5, y.intersp=0.5)
  plot(DateTime, as.numeric(as.character(Global_reactive_power)),  xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

  

##
##Save to PNG file
##
dev.copy(png, file = "plot4.png")
dev.off()
