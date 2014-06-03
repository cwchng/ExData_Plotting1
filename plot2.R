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
 
  # plot 2
  png("plot2.png",480,480)
  plot(df2$datetime, df2$Global_active_power, type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)")
  
  dev.off()
}