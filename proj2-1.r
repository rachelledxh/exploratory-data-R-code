### plot1.R
setwd("/Users/xiuhongdu/Desktop/proj2")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

total_pm2.5<- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

png(filename="./plot1.png")
plot(total_pm2.5$year,total_pm2.5$x,xlab="Year",ylab="Total PM2.5")
dev.off()

### plot2.R

setwd("/Users/xiuhongdu/Desktop/proj2")
NEI <- readRDS("summarySCC_PM25.rds")

Baltimore<- subset(NEI,NEI$fips == "24510")
total_pm2.5_Baltimore<- aggregate(Baltimore$Emissions, by=list(year=Baltimore$year), FUN=sum)
png(filename="./plot2.png")
plot(total_pm2.5_Baltimore$year,total_pm2.5_Baltimore$x,xlab="Year",ylab="Total PM2.5 Baltimore")
dev.off()

### plot3.R
library(ggplot2)
library(gridExtra)
setwd("/Users/xiuhongdu/Desktop/proj2")
NEI <- readRDS("summarySCC_PM25.rds")

Baltimore_point<- subset(NEI,NEI$fips == "24510"& NEI$type=="POINT")
Baltimore_nonpoint<- subset(NEI,NEI$fips == "24510"& NEI$type=="NONPOINT")
Baltimore_onroad<- subset(NEI,NEI$fips == "24510"& NEI$type=="ON-ROAD")
Baltimore_nonroad<- subset(NEI,NEI$fips == "24510"& NEI$type=="NON-ROAD")

png(filename="./plot3.png")
p1 <- qplot(year, Emissions, data=Baltimore_point,main="Type= Point",stat="summary", fun.y="sum")
p2 <- qplot(year, Emissions, data=Baltimore_nonpoint, main="Type= NonPoint",stat="summary", fun.y="sum")
p3 <- qplot(year, Emissions, data=Baltimore_onroad, main="Type= OnRoad",stat="summary", fun.y="sum")
p4 <- qplot(year, Emissions, data=Baltimore_nonroad, main="Type= NonRoad",stat="summary", fun.y="sum")
grid.arrange(p1, p2, p3, p4)
dev.off()

### plot4.R

setwd("./Desktop/proj2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC[,4]<-as.character(SCC[,4])
SCC[,1]<-as.character(SCC[,1])
SCC_Code_subset <- SCC[grep("Coal", SCC[,4]), ]
SCC_Code<- unique(SCC_Code_subset[,1])
NEI_subset<- NEI[NEI$SCC %in% SCC_Code, ]
Emission_Coal<- aggregate(NEI_subset$Emissions, by=list(year=NEI_subset$year), FUN=sum)
png(filename="./plot4.png")
plot(Emission_Coal$year,Emission_Coal$x,xlab="Year",ylab="Total emissions from coal combustion-related sources")
dev.off()


##lst <- list(SCC_Code_subset)
##y<- unique(unlist(lapply(lst, function(x) unique(x[,1]))))
## eg2011cleaned <- eg2011[!eg2011$ID %in% bg2011missingFromBeg, ]


### plot5.R

setwd("./Desktop/proj2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC[,7]<-as.character(SCC[,7])
SCC[,1]<-as.character(SCC[,1])
SCC_Code_subset2 <- SCC[grep("Mobile Sources", SCC[,7]), ]
SCC_Code2<- unique(SCC_Code_subset2[,1])
Baltimore<- subset(NEI,NEI$fips == "24510")
NEI_subset_Bal<- Baltimore[Baltimore$SCC %in% SCC_Code2, ]
Emission_Bal<- aggregate(NEI_subset_Bal$Emissions, by=list(year=NEI_subset_Bal$year), FUN=sum)
png(filename="./plot5.png")
plot(Emission_Bal$year,Emission_Bal$x,xlab="Year",ylab="Total emissions from motor vehicle sources in Baltimore")
dev.off()


### plot6.R
library(ggplot2)
library(gridExtra)
setwd("./Desktop/proj2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC[,7]<-as.character(SCC[,7])
SCC[,1]<-as.character(SCC[,1])
SCC_Code_subset2 <- SCC[grep("Mobile Sources", SCC[,7]), ]
SCC_Code2<- unique(SCC_Code_subset2[,1])
Los<- subset(NEI,NEI$fips == "06037")

NEI_subset_Los<- Los[Los$SCC %in% SCC_Code2, ]
Emission_Los<- aggregate(NEI_subset_Los$Emissions, by=list(year=NEI_subset_Los$year), FUN=sum)

png(filename="./plot6.png")
p5 <- qplot(year, x, data=Emission_Bal,main="Baltimore City")
p6 <- qplot(year, x, data=Emission_Los, main="Los Angeles County")

grid.arrange(p5, p6)
dev.off()
