plot3 <- function(file){
  ##read the data, subset the data frame to get only the dates we're looking at
  date_range<-c("1/2/2007", "2/2/2007")
  data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date %in% date_range,]
  
  ##create a new column called Dates_Times
  data <- transform(data, Dates_Times = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))

  ##create the plot and save to a png
  png("plot3.png")
  plot(data$Dates_Times, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(data$Dates_Times, data$Sub_metering_2, type = "l", col = "red")
  lines(data$Dates_Times, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), 
         col = c("black", "red", "blue"))
  dev.off()
}