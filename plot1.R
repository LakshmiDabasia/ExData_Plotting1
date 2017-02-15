#Unzip folder "ExData_Plotting1-master"
#Set this folder as the working directory using setwd()

#Read in data
HPCData <- read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

#Clean, format and subset data to relevant set
HPC<-HPCData
library(chron)
HPC$Date<-as.POSIXct(HPC$Date, format="%d/%m/%Y")
HPC$Date<-as.Date(HPC$Date)
HPC$Time<-chron(times=HPC$Time)
data<-subset(HPC, HPC$Date=="2007-02-01" | HPC$Date=="2007-02-02")
data$datetime <- with(data, paste(Date, Time))
data$datetime <- as.POSIXct(data$datetime)

#prepare plot1 data
data$Global_active_power<-as.numeric(data$Global_active_power)

#create plot1 as png
png("plot1.png", width=480, height = 480, units = "px")
hist(data$Global_active_power, breaks=14, main = "Global Active Power", col ="red", xlab = "Global Active Power (kilowatts)")
dev.off()