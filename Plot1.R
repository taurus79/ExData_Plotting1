Plot1 <- function() {

    library(dplyr)
  
    ## read data from the given data file
    data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
  
    ## subset data for the date of 2007-02-01 and 2007-02-02 from the originally imported data  
    data.f <- filter(data, Date =='1/2/2007' | Date =='2/2/2007')
    
    ## Open the graphic device for plotting
    png("Plot1.png", units="px", width=3200, height=3200, res=400)
    ## Draw the Plot1
    hist(data.f$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")
    ## Close the graphic device
    dev.off()
}
