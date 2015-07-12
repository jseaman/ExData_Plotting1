check_package <- function (package_name)
{
    if (!require(package_name, character.only = TRUE))
    {
        install.packages(package_name)
        require(package_name, require(package_name, character.only = TRUE))
    }
}

get_data <- function ()
{
    check_package("lubridate")
    check_package("sqldf")
    check_package("dplyr")
    
    if (!file.exists("data.Rda"))
    {
        message("Downlading data")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "data.zip", method="curl")
        unzip("data.zip")
        
        # code based on a piece of code taken from discussion forums
        data <- read.csv.sql("household_power_consumption.txt",
                             sep=";",
                             sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                             colClasses = rep("character", 9))
        
        data[,3:9] <- lapply(data[,3:9], as.numeric)
        data = data[complete.cases(data),]
        
        data <- 
            tbl_df(data) %>% 
            mutate(newDate = dmy_hms(paste0(Date," ",Time))) %>% 
            select(Date=newDate, Global_active_power:Sub_metering_3)
        
        save(data,file="data.Rda")
        
        unlink("data.zip")
        unlink("household_power_consumption.txt")
        
        data
    }   
    else
    {
        load("data.Rda")
        
        data    
    }
}