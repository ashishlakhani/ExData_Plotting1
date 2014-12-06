createPlot2<- function (){  
  file="./data_3/household_power_consumption.txt"
  data <- read.csv(file,header = TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  #Filter data for dates 1/2/2007 and 2/2/2007
  #Filter out NA values
  filter_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") & data$Global_active_power != '?',]
  #Output to PNG
  png("plot2.png", width = 480, height = 480)
  ##Plot the charts for Global_active_power
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),
       as.numeric(filter_data$Global_active_power),type="l",
       ylab="Global Active Power (kilowatts)",
       xlab="")
  dev.off()
}