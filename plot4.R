plot4<-function()
{
  library(data.table)
  library(datasets)
  
  Sys.setlocale("LC_TIME", "English")
  
  data<- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",
                    dec=".",na.strings = "?")
  my.data <-data[ which(data$Date==("1/2/2007") | data$Date==("2/2/2007")),]
  my.data$DateTime <- strptime(paste(my.data$Date,my.data$Time,sep = " "), 
                               format = "%d/%m/%Y %H:%M:%S")
 
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  plot(my.data$DateTime,my.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(my.data$DateTime,my.data$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
 
  plot(my.data$DateTime,my.data$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  lines(my.data$DateTime,my.data$Sub_metering_2,col="red")
  lines(my.data$DateTime,my.data$Sub_metering_3,col="blue")
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty = c(1,1,1))
 
   plot(my.data$DateTime,my.data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")
  
 dev.off()
  
} 
  

   