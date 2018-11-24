#Data Science Coursera
#Exploratory Data Analysis
#Week 1 Course Project
#Addi Faerber, 2018

#Plot 2 - a line graph of global active power over time

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
#named plot2.png
png("plot2.png",width = 480, height = 480)


#Plot Chart 1-------------------------------
#Histogram of Global Active Power 
#12 buckets
#Red bars
lines(dat$Date, dat$Global_active_power,
     main = "Global Active Power",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(as_datetime("2007-02-01 00:00"),as_datetime("2007-02-02 00:00")), labels = c("Thu","Fri"))

dev.off()
