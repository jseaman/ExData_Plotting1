# loads scripts from "get_data.R" to download and clean the data
source("get_data.R")

data <- get_data()

curr <- dev.cur()

png("plot2.png",480,480)

with(
    data, 
    plot(Date, Global_active_power, 
         type="l", 
         xlab="", 
         ylab="Global Active Power (kilowatts)"))

dev.off()

dev.set(curr)