setwd("/home/nishant/coursera/R/dataexploration")

require("sqldf")
require("tidyr")

filterData <- read.csv.sql ("household_power_consumption.txt", sep = ";",
                            sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'" 
                            , eol = "\n")

print(names(filterData))

globalActivePower <- as.numeric(filterData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

#function to replace blanks with missing
question2na <- function(x){ 
  z <- gsub("?", "", x)  #make sure it's "" and not " " etc
  x[z=="?"] <- NA 
  return(x)
}

