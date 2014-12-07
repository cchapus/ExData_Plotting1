#############################################################
## name   : plot2.R                                        ##
## aim    : Read the data from UC Irvine Machine Learning  ##
##          Repository and plot the Global Active Power    ##
##          as function as the Date                        ##
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

## Plot the Global Active Power as function as the Date and save it as PNG file
png(file="plot2.png",width=480,height=480)
with(data2,plot(Time.good,Global_active_power,type="l",main="",xlab="",ylab="Glocal Active Power (kilowatts)"))
dev.off()

