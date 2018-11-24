#Data Science Coursera
#Exploratory Data Analysis
#Week 1 Course Project
#Addi Faerber, 2018

#Plot 1 - A histogram of Global Active Power

#Library Calls-------------
library(tidyverse)
library(readr)

#Source Functions ----------
source("./functions.R")

#Load data ----------

if(file.exists("./data/tidydata.csv")) {
    dat <- read_csv("./data/tidydata.csv" )
  } else { 
    dat <- importData(downloadData())
  }

#Save as PNG, 480px x 480px
#named plot1.png
png("plot1.png",width = 480, height = 480)


#Plot Chart 1-------------------------------
#Histogram of Global Active Power 
#12 buckets
#Red bars
hist(dat$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")


dev.off()
