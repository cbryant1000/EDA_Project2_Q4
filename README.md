# EDA_Project2_Q4
## JHU Data Science, Exploratory Data Analysis - Project 2 

***

This project consists of some R scripts related to Question 4 for Course Project 2 of the JHU Data Science course, "Exploratory Data Analysis."  

> Question 4: "Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?"

In particular, this project consists of some experiments with displaying EPA PM2.5 Emission data in the form of geographical maps of the United States.

As you can probably tell, from looking at the script, I was also experimenting with the [plyr](http://cran.r-project.org/web/packages/plyr/index.html) and [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) packages.

***

1. [plot4.R](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4.R) was the first attempted solution to this problem.  No maps were involved.  Instead, a barchart with facets was created using [ggplot2](http://ggplot2.org/).  This plot enabled me to get an initial *look* at the data.

![](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4.png)

2. [plot4map.R](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4map.R) was the second attempt.  This script uses the 'map' plotting function from the [maps package](http://cran.r-project.org/web/packages/maps/index.html).  The motivation behind this plot was to explore the relationship of emissions to geographic location on a map of the United States.

![](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4map.png)

Doesn't the map look better by the year 2008?  There is many more green states in the map by this time.

There may be some issues with this plot.  For example, the two parts of Michigan are plotting in two different colors.  And, Wisconsin doesn't seem to be plotting in the correct color.  I checked some of the numbers, both by looking at the actual numbers, and also by referring to the bar chart.  The plot looks *basically* correct.  So far, the two above mentioned items are the only discrepancies that I have found.

3. plot4ggmap.R is the most recent attempt.  This script uses the ggmap (ggplot2) function to plot the emission data on a map of the United States.

***

**CAVEAT:** I don't claim to be an expert at R programming.  Some of the data manipulation steps in the above scripts may be kind of messy and kludgey.  But, they get the job done.  The scripts could probably be cleaned up at bit, from this point of view, and be made more efficient.

***
