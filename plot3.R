## plot3.R
## Created by Noah Hughes
## Completed 7/11/2015
## This program assumes that you have access to the household_power_consumption.txt
## This program also assume that the dataset is in the current directory that you are running in

plot3 <- function()
{
  
  hp <- read.csv("./household_power_consumption.txt", sep = ";", na.strings='?', 
                 colClasses=c(rep('character', 2), rep('numeric', 7)))
  
  hp$DateTime <- paste(hp$Date, hp$Time)
  hp$DateTime <- strptime(hp$DateTime, "%d/%m/%Y %H:%M:%S", tz = "")
  
  
  Feb07 <- subset(hp, DateTime >= strptime("2007-02-01", "%Y-%m-%d", tz = "")&DateTime < strptime("2007-02-03", "%Y-%m-%d", tz = ""))
  
  #Open device
  png(filename='plot3.png', width = 480, height = 480, units = "px")
  
  # Make plot  
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(Feb07$DateTime, Feb07$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Feb07$DateTime, Feb07$Sub_metering_2, type="l", col="red")
  lines(Feb07$DateTime, Feb07$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
  
  
  # Turn off device
  dev.off()
  
  ## dataset <- read.csv("./household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") , sep = ";", )
}