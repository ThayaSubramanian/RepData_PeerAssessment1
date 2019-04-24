## create data without missing values
act.complete <- na.omit(activity)
  
##1. Calculate total number of steps taken per day 
act.day <- group_by(act.complete,date)
act.day <- summarize(act.day, steps = sum(steps))
summary(act.day)

## 2. If you do not understand the difference between a histogram and a barplot, research the difference between them. 
##Make a histogram of the total number of steps taken each day*/

library(ggplot2)
qplot(steps, data=act.day)

##3. Calculate and report the mean and median of the total number of steps taken per day
mean(act.day$steps)
median(act.day$steps)
