# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

# This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Question 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

agg <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")

barplot(height = agg$Emissions, names.arg = agg$year, xlab = "Years", ylab = "Total PM2.5 Emission", main = "Total PM2.5 Emission by Year")

dev.off()

