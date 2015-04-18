# EDA_Project2_Q4
## JHU Data Science, Exploratory Data Analysis - Project 2 

***

This project consists of some R scripts related to Question 4 for Course Project 2 of the JHU Data Science course, "Exploratory Data Analysis."  

> Question 4: "Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?"

In particular, this project consists of some experiments with displaying EPA PM2.5 Emission data in the form of geographical maps of the United States.

1. [plot4.R](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4.R) was the first attempted solution to this problem.  No maps were involved.  Instead, a barchart with facets was created using ggplot2.

![](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4.png)

2. [plot4map.R](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4map.R) was the second attempt.  This script uses the 'map' plotting function from the [maps package](http://cran.r-project.org/web/packages/maps/index.html).

![](https://github.com/cbryant1000/EDA_Project2_Q4/blob/master/plot4map.png)

3. plot4ggmap.R is the most recent attempt.  This script uses the ggmap (ggplot2) function to plot the emission data on a map of the United States.
