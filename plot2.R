plot2 <- function(file){
  ##read the data, subset the data frame to get only the dates we're looking at
  date_range<-c("1/2/2007", "2/2/2007")
  data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date %in% date_range,]
  
  ##create a new column called Dates_Times
  data <- transform(data, Dates_Times = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
  
  ##create the plot and save to a png
  png("plot2.png")
  plot(data$Dates_Times, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}