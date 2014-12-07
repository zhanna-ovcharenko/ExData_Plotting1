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
##Create a plot
##
par(bg = NA)

hist(as.numeric(as.character(energy$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##
##Save to PNG file
##
dev.copy(png, file = "plot1.png", bg = "transparent")
dev.off()
