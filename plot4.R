#############################################################
## name   : plot4.R                                        ##
## aim    : Read the data from UC Irvine Machine Learning  ##
##          Repository and plot 4 differents plots         ##
## output : png image file 480 pixels by 480 pixels        ##
#############################################################


## Read the input file with specifications (NA string and classes of columns)
data=read.csv(file="household_power_consumption.txt",sep=";",header=TRUE,
              na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Convert the Date column into Date format
data$Date=as.Date(data$Date,format="%d/%m/%Y")
## Convert the Time column into Time format
data$Time.good=strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

## Create a subset of data in order to keep the data from the dates 2007-02-01 and 2007-02-02
data2=data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

## Prepare the PNG output file
png(file="plot4.png",width=480,height=480)
## Create a grid 2 by 2
par(mfcol = c(2,2))
## Plot the Global Active Power as function as the Date
with(data2,plot(Time.good,Global_active_power,type="l",main="",xlab="",ylab="Glocal Active Power (kilowatts)"))
## Plot the Energy sub metering as function as the Date
with(data2,plot(Time.good,Sub_metering_1,type="n",main="",xlab="",ylab="Energy sub metering"))
with(data2,lines(Time.good,Sub_metering_1,col="black"))
with(data2,lines(Time.good,Sub_metering_2,col="red"))
with(data2,lines(Time.good,Sub_metering_3,col="blue"))
legend("topright",lty= c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="n")
## Plot the Voltage as function as the Date
with(data2,plot(Time.good,Voltage,type="l",main="",xlab="datetime",ylab="Voltage"))
## Plot the Global reactive power as function as the Date
with(data2,plot(Time.good,Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power"))
## Finish the PNG file
dev.off()
