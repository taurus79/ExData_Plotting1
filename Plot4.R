Plot4 <- function() {
  
  library(dplyr)
  
  ## read data from the given data file
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
  
  ## subset data for the date of 2007-02-01 and 2007-02-02 from the originally imported data  
  data.f <- filter(data, Date =='1/2/2007' | Date =='2/2/2007')
  
  ## combine date and time strings and then convert it as POSIXlt format using strptime function 
  data.f <- transform(data.f, tmp_time = strptime(paste(data.f$Date, data.f$Time, sep=" "), format='%d/%m/%Y %H:%M:%S'))
  
  ## Open the graphic device for plotting
  png("Plot4.png", units="px", width=3200, height=3200, res=500)
  
  ## Draw the Plot4
  par(mfrow=c(2,2))
  
  with(data.f, {
    plot(tmp_time, Global_active_power, type = "l", xlab="", ylab="Global Active Power")
    
    plot(tmp_time, Voltage, type="l", xlab="datetime")
    
    plot(data.f$tmp_time, data.f$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(tmp_time, Sub_metering_1, col="black")
    lines(tmp_time, Sub_metering_2, col="red")
    lines(tmp_time, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, bty="n")
    
    plot(data.f$tmp_time, data.f$Global_reactive_power, type="l", xlab="datetime", ylab="Global_recative_power")
  })
  
  ## Close the graphic device
  dev.off()
}
