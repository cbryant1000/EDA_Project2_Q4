#
# plot4.R, Coal Emissions (PM2.5) across the United States, 1999-2008.
# Question: How have coal combustion-related emissions changed across the U.S. from 1999 to 2008?
# Cliff Bryant, Exploratory Data Analysis, April 2015.
#

library(ggplot2)
library(dplyr)
library(stringr)
source("loadRDS.R")

data(county.fips)
data(state)
#nei <- NULL
nei <- loadRDS(nei, "summarySCC_PM25.rds")
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
names(dat)[3] <- "Emissions"
dat <- transform(dat, Emissions = Emissions / 1.e3)
years <- c("1999","2002","2005","2008")

png("plot4.png", width=480,height=480)
par(mfrow=c(2,2),xpd=NA,mar=c(1,1,1,1),oma=c(0.25,0.25,2,0.25))
colors <- c("green","yellow","red1","red3")
mapply(function(yr) {
  group <- subset(dat, dat$year == yr)
  print(group)
  colorsmatched <- as.numeric(cut(group$Emissions, c(0, 3, 10, 30, 200)))
  map("state", region=group$state, col = colors[colorsmatched], fill = TRUE, 
      resolution = 0, lty = 1, projection = "polyconic", xpd=NA)
  title(yr)
  if (yr == "1999") {
    leg <-legend("bottomright",title="1000 tons",inset=c(-.21,-.28), c("0-3", "3-10", "10-30", "> 30"), horiz = FALSE, fill = colors)
  }
}, years)
title("U.S. Coal Emissions by State, 1999-2008",outer=TRUE)
dev.off()
