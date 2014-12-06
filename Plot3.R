createPlot3<- function (){  
  file="./data_3/household_power_consumption.txt"
  #Read the csv file
  data <- read.csv(file,header = TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  #Filter data for dates 1/2/2007 and 2/2/2007
  #Filter out NA values
  filter_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") & data$Global_active_power != '?',]
  #Define the range for graph
  yrange<-range(c(as.numeric(filter_data$Sub_metering_1),as.numeric(filter_data$Sub_metering_2),as.numeric(filter_data$Sub_metering_3)))
  #Output to png file
  png("plot3.png", width = 480, height = 480)  
  #plot(ylab="Energy Sub Metering",legend="Sub_metering_1")
  ##Plot line for submetering 1
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),
        as.numeric(filter_data$Sub_metering_1),type="l",ylim=yrange,ylab="Energy sub metering",xlab="")
  par(new=F)
  ##Plot line for submetering 2
  lines(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),
        as.numeric(filter_data$Sub_metering_2),type="l",ylim=yrange,col='red')
  par(new=F)
  ##Plot line for submetering 3
  lines(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),
        as.numeric(filter_data$Sub_metering_3),type="l",ylim=yrange,col='blue')
  ##Define legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'))
  dev.off()
}