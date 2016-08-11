
setwd("./Desktop/proj1")
mydata = read.table("household_power_consumption.txt",sep=";",header=TRUE) 
mydata[,1]<- as.Date(mydata[,1],format="%d/%m/%Y")
## mydata1<- with(mydata,Global_active_power[Date=="2007-02-01" | Date=="2007-02-02"])
mydata1<- subset(mydata,Date=="2007-02-01" | Date=="2007-02-02",select=Global_active_power)
mydata1<- as.numeric(unlist(mydata1))




png(file="plot1.png")
hist(mydata1, 
     col="red",
     border="black",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency",
     xlim=c(0,3000),ylim=c(0,1200),axes=FALSE)
axis(side=1, at=seq(0,3000,1000), labels=seq(0,6,2))
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))
dev.off

     