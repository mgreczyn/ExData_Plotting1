plot4 <- function(file){
  ##read the data, subset the data frame to get only the dates we're looking at
  date_range<-c("1/2/2007", "2/2/2007")
  data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date %in% date_range,]
  
  ##create a new column called Dates_Times
  data <- transform(data, Dates_Times = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
  
  ##open the PNG file device
  png("plot4.png")
  
  ##4 figures in 2 rows and 2 columns
  par(mfrow = c(2,2))
  
  ##create the first plot
  plot(data$Dates_Times, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  ##Create the second plot
  plot(data$Dates_Times, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  ##create the third plot 
  plot(data$Dates_Times, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(data$Dates_Times, data$Sub_metering_2, type = "l", col = "red")
  lines(data$Dates_Times, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), 
         col = c("black", "red", "blue"))
  
  ##Create the fourth plot
  plot(data$Dates_Times, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")
  
  ##Close the png file device
  dev.off()
}
