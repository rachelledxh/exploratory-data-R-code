setwd("./Desktop/proj1")
mydata = read.table("household_power_consumption.txt",sep=";",header=TRUE) 
mydata[,10]<- paste(mydata[,1],mydata[,2])
mydata[,10]<- as.POSIXct(strptime(mydata[,10],"%d/%m/%Y %H:%M:%S"))
mydata[,1]<- as.Date(mydata[,1],format="%d/%m/%Y")
mydata2<- subset(mydata,Date=="2007-02-01" | Date=="2007-02-02",select=c(V10,Global_active_power))
mydata2<- as.numeric(unlist(mydata2))
dat$a <- scale(dat$a, center = FALSE, scale = max(dat$a, na.rm = TRUE)/100)

plot(mydata2[,1],mydata2[,2]/500)
axis(side=2, at=seq(0,3000,1000), labels=seq(0,6,2))