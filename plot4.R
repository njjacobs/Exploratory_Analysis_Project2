# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Merge the Data 

MergedData <- merge(NEI, SCC, by = "SCC")

# Question 3

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

# Search for matches of coal (SCC) in MergedData

Coal <- grepl("coal", MergedData$Short.Name, ignore.case = TRUE)
Coalsubset <- MergedData[Coal,]

agg <- aggregate(Emissions ~ year,Coalsubset, sum)

png("plot4.png", width=640, height=480)

graph <- ggplot(agg, aes(factor(year), Emissions, fill = year))

graph <- graph + geom_bar(stat = "identity") + xlab("year") + ylab("Total PM2.5") +ggtitle("Total PM2.5 for Coal Emissions from 1999 to 2008")

print(graph)

dev.off()
