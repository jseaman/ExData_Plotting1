# loads scripts from "get_data.R" to download and clean the data
source("get_data.R")

data <- get_data()

curr <- dev.cur()

png("plot4.png",480,480)

par(mfrow=c(2,2))

with(data,
     {
        #plot 1
        plot(Date, Global_active_power, 
             type="l", 
             xlab="", 
             ylab="Global Active Power")

        #plot 2
        plot(Date, Voltage,
             type="l",
             xlab="datetime")    

        #plot 3
        plot(Date, Sub_metering_1, 
            type="l", xlab="", 
            ylab="Energy sub metering")

        lines(Date, Sub_metering_2, col="red")

        lines(Date, Sub_metering_3, col="blue")

        legend("topright", 
            lty=1, 
            col=c("black","red","blue"), 
            bty="n",
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

        #plot 4
        plot(Date, Global_reactive_power,
             type="l",
             xlab="datetime")
     })

dev.off()

dev.set(curr)
