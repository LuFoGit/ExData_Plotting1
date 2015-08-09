## courses/04_ExploratoryAnalysis
## Programming Assignment 1, Plot 4: 2x2 layout
## LuFo 09.08.2015
##

plot4 <- function() {
  ## function to plot data on screen and into png as well

  # debug / production mode
  myPlotToFile <- TRUE
  
  # read data file, but restrict to first rows we're interested in
  datafile <- read.table("~/workspace/04P01/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=70000)
  
  # subset on two days analysis will run on
  data2 <- datafile[as.Date(datafile$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(datafile$Date, "%d/%m/%Y") < as.Date("2007-02-03"), ]
  
  # free memory of large input file
  rm(datafile)
  
  # plot on screen or file, depending on debug / production
  if(myPlotToFile == TRUE) {
    # plot into png
    png(filename = "plot4.png")
  }

  ## open 2x2 screen layout
  par(mfrow=c(2,2))
  ## 4.1
  plot(data2$Global_active_power, ylab="Global Active Power", xlab="", main="", col=1, type="l", xaxt='n')
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  ## 4.2
  plot(data2$Voltage, ylab="Voltage", xlab="datetime", main="", col=1, type="l", xaxt='n')
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  ## 4.3
  plot(data2$Sub_metering_1, ylab="Energy sub metering", xlab="", main="", col=1, type="l", xaxt='n')
  lines(data2$Sub_metering_2, col=2, type="l")
  lines(data2$Sub_metering_3, col=4, type="l")
  legend("topright", bty = "n", lty=1, col = c(1, 2, 4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  ## 4.4
  plot(data2$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", main="", col=1, type="l", xaxt='n')
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  
  if(myPlotToFile == TRUE) {
    # clode file
    dev.off()
  }
  
  # free memory of file handling
  rm(data2)
  # garbage collector
  gc()
  
  # return to console
  invisible()
  
}