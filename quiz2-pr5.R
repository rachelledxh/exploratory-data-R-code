 data <- read.csv("./Desktop/getdata-wksst8110.for", header = TRUE)
file_name <- "./Desktop/getdata-wksst8110.for"
 df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
 sum(df[, 4])
 
 
 library(lattice)
 library(datasets)
 data(airquality)
 p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
 
 set.seed(1234)
 par(mar=c(0,0,0,0))
 x<- rnorm(12,mean=rep(1:3,each=4),sd= 0.2)
 y<- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
 plot(x,y,col="blue",pch=19,cex=2)
 text(x+0.05,y+0.05,labels=as.character(1:12))
 
 dataFrame<- data.frame(x=x,y=y)
distxy<-  dist(dataFrame)
hClustering<- hclust(distxy)

dataFrame<- data.frame(x=x,y=y)
set.seed(143)
dataMatrix<- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)


plot(hClustering)
 
 