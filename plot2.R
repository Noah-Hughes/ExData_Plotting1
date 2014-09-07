## plot2.R
## Created by Noah Hughes
## Started 9/4/2014
## This program assumes that you have access to the household_power_consumption.txt
## This program also assume that the dataset is in the current directory that you are running in

plot2 <- function()
{
  
  hp <- read.csv("./household_power_consumption.txt", sep = ";", na.strings='?', 
                 colClasses=c(rep('character', 2), rep('numeric', 7)))
  
  hp$DateTime <- paste(hp$Date, hp$Time)
  hp$DateTime <- strptime(hp$DateTime, "%d/%m/%Y %H:%M:%S", tz = "")
  
  
  Feb07 <- subset(hp, DateTime >= strptime("2007-02-01", "%Y-%m-%d", tz = "")&DateTime < strptime("2007-02-03", "%Y-%m-%d", tz = ""))
  
  #Open device
  png(filename='plot2.png', width = 480, height = 480, units = "px")
  
  # Make plot  
  plot(Feb07$DateTime, Feb07$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  # Turn off device
  dev.off()
  
  ## dataset <- read.csv("./household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") , sep = ";", )
}