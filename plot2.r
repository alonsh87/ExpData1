plot2<-function()
{
  library(data.table)
  library(datasets)
  
  Sys.setlocale("LC_TIME", "English")
  
  data<- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",dec=".",na.strings = "?")
  my.data <-data[ which(data$Date==("1/2/2007") | data$Date==("2/2/2007")),]
  
  my.data$DateTime <- strptime(paste(my.data$Date,my.data$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")
  
 
  my.data$Global_active_power<-as.numeric(my.data$Global_active_power)

  
  png("plot2.png", width=480, height=480)
  plot(my.data$DateTime,my.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
 
} 

