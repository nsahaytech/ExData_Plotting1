setwd("/home/nishant/coursera/R/dataexploration")

require("sqldf")
require("tidyr")

filterData <- read.csv.sql ("household_power_consumption.txt", sep = ";",
                            sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'" 
                            , eol = "\n")

print(names(filterData))

datetime <- strptime(paste(filterData$Date, filterData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filterData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



