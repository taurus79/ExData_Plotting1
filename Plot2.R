Plot2 <- function() {
  
  library(dplyr)
  
  ## read data from the given data file
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
  
  ## subset data for the date of 2007-02-01 and 2007-02-02 from the originally imported data  
  data.f <- filter(data, Date =='1/2/2007' | Date =='2/2/2007')
  
  ## combine date and time strings and then convert it as POSIXlt format using strptime function 
  data.f <- transform(data.f, tmp_time = strptime(paste(data.f$Date, data.f$Time, sep=" "), format='%d/%m/%Y %H:%M:%S'))
  
  ## Open the graphic device for plotting
  png("Plot2.png", units="px", width=3200, height=3200, res=400)
  ## Draw the Plot2
  plot(data.f$tmp_time, data.f$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  ## Close the graphic device
  dev.off()
}
