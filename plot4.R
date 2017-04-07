plot4 <- function(t) {

  ## plot four graphs onto the same device
  
  ## open the output device = png
  outFile <- ".\\plot4.png"
  png(outFile, width = 480, height = 480)
  
  ## set the device to two columns and two rows
  par(mfrow = c(2, 2))
  
  ## generate the first graphik -> line Global Active Power / time
  plot(t$timestamp, t$Global_active_power, 
       type = "l",
       main = NULL,
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  ## generate the second graphic -> line Voltage / time
  plot(t$timestamp, t$Voltage, 
       type = "l",
       main = NULL,
       xlab = "datetime",
       ylab = "Voltage")
  
  ## generate the fourth graphic -> Energie Sub Meterings / time
  xrange <- range(t$timestamp)
  yrange <- range(c(range(t$Sub_metering_1), range(t$Sub_metering_2), range(t$Sub_metering_3)))
  
  plot(xrange, yrange, type = "n",
       main = NULL,
       xlab = "",
       ylab = "Energy sub metering" )
  ## add the lines per meter
  lines(t$timestamp, t$Sub_metering_1, type = "l", col = "black")
  lines(t$timestamp, t$Sub_metering_2, type = "l", col = "red")
  lines(t$timestamp, t$Sub_metering_3, type = "l", col = "blue")
  
  ## add the legend
  legend("topright", legend = names(t)[grep("^Sub*", names(t))],
         lty = c(1, 1, 1), col = c("black", "red", "blue"),
         lwd = c(1.5, 1.5, 1.5), bty = "n", cex = 0.9)
  
  ## generate the fourth graphics -> Global_reactive_power / time
  plot(t$timestamp, t$Global_reactive_power, 
       type = "l",
       main = NULL,
       xlab = "datetime",
       ylab = "Global Active Power (kilowatts)")
  
  ## close the device
  dev.off()
  
}