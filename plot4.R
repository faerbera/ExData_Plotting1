#Data Science Coursera
#Exploratory Data Analysis
#Week 1 Course Project
#Addi Faerber, 2018

#Plot 4 - a composite of multiple graphs

#Library Calls-------------
library(tidyverse)

#Source Functions ----------
source("./functions.R")

#Load data ----------

if(file.exists("./data/tidydata.csv")) {
  dat <- read_csv("./data/tidydata.csv" )
} else { 
  dat <- importData(downloadData())
}


#Save as PNG, 480px x 480px
#named plot4.png
plot.new()
png("plot4.png",width = 480, height = 480)


#Plot Chart-------------------------------
#set parameters to plot 2x2 charts
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Upper left - from Plot 1
plot(dat$dateTime, dat$Global_active_power,
     main = "Global Active Power",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     type = "l")

#Upper Right
plot(dat$dateTime, dat$Voltage, 
     ylab = "Voltage", 
     xlab = "datetime", 
     type = "l")

#Lower Left
with(dat, plot(dateTime, Sub_metering_1, type = "l", 
               ylab = "Energy sub metering", xlab = ""))
lines(dat$dateTime, dat$Sub_metering_2, col = "red")
lines(dat$dateTime, dat$Sub_metering_3, col = "blue")
legend("topright", lty=1, lwd=2, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Lower Right
plot(dat$dateTime, dat$Global_reactive_power, 
     type = "l", 
     xlab = "datetime")

dev.off()
