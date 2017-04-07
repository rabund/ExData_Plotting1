plot1 <- function(t) {

    ## make a history diagram of global active power values
  
    ## open the output device = png
    outFile <- ".\\plot1.png"
    png(outFile, width = 480, height = 480)
    ## plot the histogram
    hist(t$Global_active_power,
            col="red",
            main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)",
            ylab = "Frequency"
        )
    ## close the file
    dev.off()
}