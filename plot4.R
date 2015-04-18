#
# plot4.R, Coal Emissions (PM2.5) across the United States, 1999-2008.
# Question: How have coal combustion-related emissions changed across the U.S. from 1999 to 2008?
# Cliff Bryant, Exploratory Data Analysis, April 2015.
#

library(ggplot2)
library(dplyr)
library(stringr)

data(county.fips)
data(state)
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
idx <- subset(scc, grepl("Coal", scc$EI.Sector,perl=TRUE) == TRUE)
dat <- subset(nei, SCC %in% idx$SCC)
counties <- transform(county.fips, fips = str_pad(fips, 5, pad = "0"))
dat <- merge(dat, counties, by.x="fips", by.y="fips")
dat <- mutate(dat, 
         year = factor(year),
         polyname = as.character(polyname),
         state = substr(polyname, 1, str_locate(polyname, ",") - 1),
         county = substr(polyname, str_locate(polyname, ",") + 1, length(polyname)))
dat <- with(dat,aggregate(Emissions,by=list(year=year, state=state),FUN=sum))
dat <- merge(dat, cbind(name=c(tolower(state.name), "district of columbia"),abb=c(state.abb, "DC")), by.x="state", by.y="name")
png("plot4.png", width=960,height=480)
print(qplot(abb,x/1.e3,data=dat,facets=year~.,geom="blank",xlab="State",ylab="PM2.5 Emissions (thousand tons)",main="U.S. Coal Emissions by State, 1999-2008")
       + geom_bar(stat="identity",fill="cyan"))
dev.off()