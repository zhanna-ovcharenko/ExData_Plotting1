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
with(energy, plot(DateTime, as.numeric(as.character(Global_active_power)), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))


##
##Save to PNG file
##
dev.copy(png, file = "plot2.png")
dev.off()
