if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  
  download.file(url,destfile = "data.zip")
}

if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  
  download.file(url,destfile = "data.zip")
}

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

names(data)
lapply(data, class)

#first few values of Date and Time
data$Date[1:10]

data$Time[1:10]

#strptime to change the factor Date and Time values in to yyyy-mm-dd hh:mm:ss. First, let's create a variables by concatenating Date and Time.
data$DateTime<-paste(data$Date, data$Time)

#help document of strptime
?strptime

#Beginning of Project

#change DateTime to yyyy-mm-dd hh:mm:ss
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#Data selection dates: 2007-02-01 and 2007-02-02.
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]

#Plotting observations
#Plot 1
hist(as.numeric(as.character(data2$Global_active_power)), # note we used as.character and as numeric since
     # the variable is factor variable.
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")











