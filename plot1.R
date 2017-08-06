hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric"), header=TRUE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
png(filename="plot1.png")
hist(hpc$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()