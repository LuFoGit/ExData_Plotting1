## courses/04_ExploratoryAnalysis
## Programming Assignment 1, Plot 2
## LuFo 09.08.2015
##

plot2 <- function() {
  ## function to plot data on screen and into png as well
  ## pre-requisite: Set working directory to function file and source it
  #setwd("workspace/04P01")
  
  # read data file, but restrict to first rows we're interested in
  datafile <- read.table("~/workspace/04P01/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=70000)
  
  # subset on two days analysis will run on
  data2 <- datafile[as.Date(datafile$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(datafile$Date, "%d/%m/%Y") < as.Date("2007-02-03"), ]
  
  # free memory of large input file
  rm(datafile)
  
  # plot on screen
  plot(data2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", main="", col=1, type="l", xaxt='n')
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  
  # plot into png
  png(filename = "plot2.png")
  plot(data2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", main="", col=1, type="l", xaxt='n')
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri","Sat"))
  dev.off()
  
  # free memory of file handling
  rm(data2)
  # garbage collector
  gc()
  
  # return to console
  invisible()
  
}