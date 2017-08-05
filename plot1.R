hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric"), header=TRUE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")