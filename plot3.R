plot3 <- function(t) {

    ## plot all three sub meterings per timestamp

    ## open the output device = png
    outFile <- ".\\plot3.png"
    png(outFile, width = 480, height = 480)

    ## set the ranges to define the axis

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
        lwd = c(2, 2, 2))

    ## close the device
    dev.off()
}