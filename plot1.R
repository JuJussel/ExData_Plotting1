##Read data and convert Date/Time 
  data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE,
              col.names = c("Date", "Time", "Global_active_power",  
                            "Global_reactive_power", "Voltage",	
                            "Global_intensity",	"Sub_metering_1",
                            "Sub_metering_2",	"Sub_metering_3"), 
              skip = 66637, nrows = 2880)
  data[ ,1] <- as.Date(data[ ,1] ,"%d/%m/%Y")
  data[ ,2] <- as.POSIXct(strptime(paste(data[ ,1] ,data[ ,2] ), 
                                  format = "%d/%m/%Y %H:%M:%S") )
## since there are no NA's skip that part
## Plot data into file
  
  png(file="Plot1.png", width=480, height=480)
  hist(a[,3], col="red", main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
  dev.off()