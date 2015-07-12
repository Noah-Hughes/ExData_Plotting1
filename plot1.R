## plot1.R
## Created by Noah Hughes
## Completed 7/11/2015
## This program assumes that you have access to the household_power_consumption.txt
## This program also assume that the dataset is in the current directory that you are running in

plot1 <- function()
{
  
  
  hp <- read.csv("./household_power_consumption.txt", sep = ";", na.strings='?', 
                 colClasses=c(rep('character', 2), rep('numeric', 7)))
  
  hp$DateTime <- paste(hp$Date, hp$Time)
  hp$DateTime <- strptime(hp$DateTime, "%d/%m/%Y %H:%M:%S", tz = "")
  
  
  Feb07 <- subset(hp, DateTime >= strptime("2007-02-01", "%Y-%m-%d", tz = "")&DateTime < strptime("2007-02-03", "%Y-%m-%d", tz = ""))
  
  #Did not work because of 21/2/2007 matches
  #Feb07 <- (subset(hp, grepl(("1/2/2007|2/2/2007"), Date)))
  
  #Open device
  png(filename='plot1.png', width = 480, height = 480, units = "px")
  
  # Make plot  
  hist(Feb07$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  
  # Turn off device
  dev.off()
  
  ## dataset <- read.csv("./household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") , sep = ";", )
}