#Data Science Coursera
#Exploratory Data Analysis
#Week 1 Course Project
#Addi Faerber, 2018

#Plot 3 - a line graph of global active power by sub-metering source

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
#named plot3.png
plot.new()
png("plot3.png",width = 480, height = 480)


#Plot -------------------------------

with(dat, plot(dateTime, Sub_metering_1, type = "l", 
               ylab = "Energy sub metering"))
lines(dat$dateTime, dat$Sub_metering_2, col = "red")
lines(dat$dateTime, dat$Sub_metering_3, col = "blue")
legend("topright", lty=1, lwd=2, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
