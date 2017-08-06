library(dplyr)

hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric"), header=TRUE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc <- mutate(hpc, date.time = as.POSIXct(paste(Date, Time), 
                                          "%d/%m/%Y %H:%M:%S", tz="GMT"))
png(filename="plot2.png")
with(hpc, plot(date.time, Global_active_power, type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"))
dev.off()