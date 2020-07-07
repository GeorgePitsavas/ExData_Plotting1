#loading data

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power_data <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


#data manipulation in date and time columns of data set

power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
power_data$Time <- strptime(power_data$Time, format="%H:%M:%S")
power_data[1:1440,"Time"] <- format(power_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_data[1441:2880,"Time"] <- format(power_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot creation

plot(power_data$Time,power_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power_data,lines(Time,Sub_metering_1))
with(power_data,lines(Time,Sub_metering_2,col="red"))
with(power_data,lines(Time,Sub_metering_3,col="blue"))
legend("topright",pch = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
