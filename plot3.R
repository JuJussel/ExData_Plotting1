##Read data and convert Date/Time 
  data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE,
              col.names = c("Date", "Time", "Global_active_power",  
                            "Global_reactive_power", "Voltage",	
                            "Global_intensity",	"Sub_metering_1",
                            "Sub_metering_2",	"Sub_metering_3"), 
              skip = 66637, nrows = 2881)
  data[ ,1] <- as.Date(data[ ,1] ,"%d/%m/%Y")
  data[ ,2] <- as.POSIXct(strptime(paste(data[ ,1] ,data[ ,2] ) , 
                                  format = "%d/%m/%Y %H:%M:%S") )
## since there are no NA's skip that part

## Instead of doing it manually I wanted the position for the ticks and the
##values to be created by code in case the date was to be changed
  ## creates ticks at position 1, halfway(+1), and end of graph
  pos <- c(1,(length(data[,1])/2)+1,length(data[,1]))
  ##converts the date into weekdays 
  days <- weekdays(as.Date(data[pos,1],'%d/%m/%Y'),abbreviate = TRUE)
    
## Plot data into file
  
  png(file = "Plot3.png", width = 480, height = 480)
  plot(data[,7], type = "l", xaxt = "n", ylab = "Energy sub metering", 
       xlab = "")
  axis(1, at = pos, labels = days)
  lines(data[ ,8], col = "red")
  lines(data[ ,9], col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2",  
                       "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2 )
  dev.off()