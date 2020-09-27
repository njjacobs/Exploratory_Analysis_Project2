# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Question 3

# Of the four types of sources indicated by the 
# type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

city <- unique(subset(NEI,fips == 24510))

aggcity2 <- aggregate(Emissions ~ year+type, city, sum)

png("plot3.png")

ggplot(aggcity2, aes(year,Emissions,color=type))+geom_line()+ylab(expression("Total PM25"))+ggtitle("Total PM25 in Baltimore City, Maryland from 1999 to 2008 by type")

dev.off()
