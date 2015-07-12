# loads scripts from "get_data.R" to download and clean the data
source("get_data.R")

data <- get_data()

curr <- dev.cur()

png("plot1.png",480,480)

hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()

dev.set(curr)
