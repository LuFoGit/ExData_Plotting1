## courses/04_ExploratoryAnalysis
## Programming Assignment 1, Plot 1
## LuFo 09.08.2015
##

plot1 <- function() {
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
  hist(data2$Global_active_power, xlab="Global active power (kilowatts)", main="Global active power", col=2 )
  
  # plot into png
  png(filename = "plot1.png")
  hist(data2$Global_active_power, xlab="Global active power (kilowatts)", main="Global active power", col=2 )
  dev.off()
  
  # free memory of file handling
  rm(data2)
  # garbage collector
  gc()
  
  # return to console
  invisible()

}