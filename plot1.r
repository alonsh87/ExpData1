plot1<-function() 
{
 library(data.table)
 library(datasets)
  
  data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
 
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")

  my.data <-data[ which(data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02")),]


  my.data$Global_active_power<-as.numeric(my.data$Global_active_power)

  png("plot1.png", width=480, height=480)
  
  hist((my.data$Global_active_power),col="red",xlab = "Globa Active Power (kilowatts)",main="Global Active Power")                        
  
  dev.off()
}
  

  