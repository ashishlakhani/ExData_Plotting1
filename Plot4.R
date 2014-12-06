createPlot4<- function (){  
  
  file="./data_3/household_power_consumption.txt"
  #Read CSV file
  data <- read.csv(file,header = TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  #Filter data for dates 1/2/2007 and 2/2/2007
  #Filter out NA values
  filter_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") & data$Global_active_power != '?',]
  #Output to png file    
  png("plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  #PLotting Global Active Power
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),as.numeric(filter_data$Global_active_power),type="l",ylab="Global Active Power",xlab="")
  #PLotting Voltage  
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),as.numeric(filter_data$Voltage),type="l",ylab="Voltage",xlab="datetime")
  yrange<-range(c(as.numeric(filter_data$Sub_metering_1),as.numeric(filter_data$Sub_metering_2),as.numeric(filter_data$Sub_metering_3)))
  #Plot Submetering
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),
       as.numeric(filter_data$Sub_metering_1),type="l",ylim=yrange,ylab="Energy sub metering",xlab="")
  par(new=F)
  lines(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),as.numeric(filter_data$Sub_metering_2),type="l",ylim=yrange,col='red')
  par(new=F)
  lines(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),as.numeric(filter_data$Sub_metering_3),type="l",ylim=yrange,col='blue')  
  #Creating Legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'))
  #Global reactive power
  plot(strptime(paste(filter_data$Date,filter_data$Time,sep=' '),'%d/%m/%Y %H:%M:%S'),as.numeric(filter_data$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")
  dev.off()
}