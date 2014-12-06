createPlot1<- function (){  
  file="./data_3/household_power_consumption.txt"
  ##Read the file
  data <- read.csv(file,header = TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  #Filter data for dates 1/2/2007 and 2/2/2007
  #Filter out NA values
  filter_data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" & data$Global_active_power != '?',]
  ##Create a png file 480x480
  png("plot1.png", width = 480, height = 480)  
  ##Plot a histogram
  hist(as.numeric(filter_data$Global_active_power), col = "red",
       main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab= "Frequency")
  dev.off()
}