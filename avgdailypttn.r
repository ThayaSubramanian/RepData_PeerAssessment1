## average daily activity pattern
##Make a time series plot (i.e. \color{red}{\verb|type = "l"|}type="l") of the 5-minute interval (x-axis) and 
##the average number of steps taken, averaged across all days (y-axis)

act.int <- group_by(act.complete, interval)
act.int <- summarize(act.int, steps=mean(steps))

ggplot(act.int, aes(interval, steps)) + geom_line()


##Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

act.int[act.int$steps==max(act.int$steps),]