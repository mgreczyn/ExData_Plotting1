plot1 <- function(file){
  ##read the data, subset the data frame to get only the dates we're looking at
  date_range<-c("1/2/2007", "2/2/2007")
  data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date %in% date_range,]
  
  ##create a new column in the data frame called Dates_Times

  ##create the histogram and save it to a png file
  png("plot1.png")
  hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}