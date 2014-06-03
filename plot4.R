get_consumption <- function(){
  
  df <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors = FALSE) 

  df2 <- subset(df, subset = ((df$Date == "1/2/2007") | (df$Date == "2/2/2007")))

  # x has the format yyyy-mm-dd
  x <- as.Date(df2$Date, format="%d/%m/%Y")

  # datetime
  datetime <-as.POSIXct(paste(x,df2$Time), tz ="")
 
  # add a column to given nine columns
  df2 <- cbind(df2, datetime)
  df2 <- na.omit(df2)
 
  # plot 4
  png("plot4.png",480,480)
  par(mfrow = c(2,2))
  
  # 1st graph
  plot(df2$datetime, df2$Global_active_power, type = "l",
                 xlab = "", ylab = "Global Active Power")
  
  # 2nd graph
  plot(df2$datetime, df2$Voltage, type = "l",
       xlab = "datetime", ylab = "Voltage")
  
  # 3rd graph
  plot(df2$datetime, df2$Sub_metering_1, type = "l",
       xlab = "", ylab = "Energy sub metering")
  
  
  lines(df2$datetime, df2$Sub_metering_2, type = "l", col = "red",
        xlab = "", ylab = "Energy sub metering")
  
  lines(df2$datetime, df2$Sub_metering_3, type = "l", col = "blue",
        xlab = "", ylab = "Energy sub metering")
  
  legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = "solid", col = c("black", "red", "blue"))
  
  # 4th graph
  plot(df2$datetime, df2$Global_reactive_power, type = "l",
       xlab = "datetime", ylab = "Global Reactive Power")


  dev.off()
}