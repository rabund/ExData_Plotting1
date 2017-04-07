plot2 <- function(t) {

  ## plot a line chart of globa Active Power per weekday
  
  ## open the output device = png
  outFile <- ".\\plot2.png"
  png(outFile, width = 480, height = 480)
  plot(t$timestamp, t$Global_active_power, 
       type = "l",
       main = NULL,
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  dev.off() 
}