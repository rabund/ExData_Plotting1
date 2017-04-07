downloadData <- function(dataDirectory) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    tmpFile <- paste0(dataDirectory, "\\data.zip")

    ## create a none existing data directory
    if (!file.exists(dataDirectory)) {
        dir.create(dataDirectory)
    }

    ## download the zip and extract it
    download.file(url, tmpFile, mode = "wb")
    unzip(tmpFile, exdir = dataDirectory)
    file.remove(tmpFile)
}

fetchData <- function(dataDirectory) {
    ## set the filename
    fileName <- paste0(dataDirectory, "\\household_power_consumption.txt")
    ## read the data
    t <- fread(fileName, sep = ";", na.strings = "?")
    fetchData <- t
}

cleanupData <- function(t,
                        ddmmyyyyFrom = as.Date("1/2/2007", "%d/%m/%Y"),
                        ddmmyyyyTo = as.Date("2/2/2007", "%d/%m/%Y")) {
    
    ## convert the date to date class
    t$date_date <- as.Date(t$Date, "%d/%m/%Y")
    ## reduce the data to the selected date range
    t <- dplyr::filter(t, date_date >= ddmmyyyyFrom & date_date <= ddmmyyyyTo)
    ## convert the time to time class
    t$timestamp <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")

    cleanupData <- t    
}
