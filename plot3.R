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
 
  # plot 3
  png("plot3.png", 480, 480)
  plot(df2$datetime, df2$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
  

  lines(df2$datetime, df2$Sub_metering_2, type = "l", col = "red",
       xlab = "", ylab = "Energy sub metering")
  
  lines(df2$datetime, df2$Sub_metering_3, type = "l", col = "blue",
       xlab = "", ylab = "Energy sub metering")
  
  legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 lty = "solid", col = c("black", "red", "blue"))
  
  dev.off()

}