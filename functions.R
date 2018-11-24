#Data Science Coursera
#Exploratory Data Analysis
#Week 1 Course Project
#Addi Faerber, 2018


#Functions common to all plots

# This code file contains functions that are common to all of the plots. Each plot code file (plot1:4.R) sources this file. 

#downloadData() -----------------------
downloadData <- function() {
  #download the dataset from the course cloud into the ./data subdirectory and unzip the file
  #to save bandwidth, if the file already exists, it is not downloaded again and the file URL is returned
  #returns the path and filename of the downloaded and unzipped txt file
  
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 
   if(!file.exists("./data")){dir.create("./data")}
  
  if(!file.exists("./data/household_power_consumption.zip")){
    download.file(fileURL, destfile = "./data/household_power_consumption.zip", method = "curl")
    local_file <- unzip("./data/household_power_consumption.zip", exdir="./data", unzip = "internal")
    return(local_file)
  } else {
    message("File already downloaded")
    return("./data/household_power_consumption.txt")
  }
 
}

#importData(file)-------------------------
importData <- function(file) {
  #Import the data file (passed typically from downloadData...)
  #Parameter file is the filename and pathway of the txt data file to import
  #Tidy the dataset and make ready for analysis
  #keeps only readings from 2007-02-01 and 2007-02-02. 
  
  require(tidyverse)
  require(lubridate)
  require(readr)
  
  dataframe <- read_delim(file, delim = ";", na = "?")
  dataframe <- dataframe %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y")) %>% 
    filter(between(Date, as.Date("2007-02-01"),as.Date("2007-02-02"))) %>% 
    mutate(dateTime = as_datetime(paste(as.character(Date),as.character(Time),sep = " ")))
  
  saveDataset(dataframe)
  return(dataframe)

  
}


#saveDataset()-------------------------
saveDataset <- function(dataframe) {
  require(readr)
  write_csv(dataframe, "./data/tidydata.csv")
  
}