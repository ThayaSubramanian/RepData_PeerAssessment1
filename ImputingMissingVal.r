
##Imputing missing values
##Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with \color{red}{\verb|NA|}NAs)

nrow(activity)-nrow(act.complete)

##Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. 
##For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc

names(act.int)[2] <- "mean.steps"
act.impute <- merge(activity, act.int)

##Create a new dataset that is equal to the original dataset but with the missing data filled in
act.impute$steps[is.na(act.impute$steps)] <- act.impute$mean.steps[is.na(act.impute$steps)]

##Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. 
##Do these values differ from the estimates from the first part of the assignment? 
##What is the impact of imputing missing data on the estimates of the total daily number of steps?

act.day.imp <- group_by(act.impute, date)
act.day.imp <- summarize(act.day.imp, steps=sum(steps))

qplot(steps, data=act.day.imp)

mean(act.day.imp$steps)

median(act.day.imp$steps)
