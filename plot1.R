get_consumption <- function(){
  
  df <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors = FALSE) 

  df2 <- subset(df, subset = ((df$Date == "1/2/2007") | (df$Date == "2/2/2007")))

  # plot 1
  png("plot1.png",480,480)
  hist(as.numeric(df2$Global_active_power), col = "red", 
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  
  dev.off()
  

}