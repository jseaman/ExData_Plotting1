# loads scripts from "get_data.R" to download and clean the data
source("get_data.R")

data <- get_data()

curr <- dev.cur()

png("plot3.png",480,480)

with(data, 
     {
         plot(Date, Sub_metering_1, 
              type="l", xlab="", 
              ylab="Energy sub metering")
         
         lines(Date, Sub_metering_2, col="red")
         
         lines(Date, Sub_metering_3, col="blue")
     })

legend("topright", 
       lty=1, 
       col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
              
        
dev.off()

dev.set(curr)