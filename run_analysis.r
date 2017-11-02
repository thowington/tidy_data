# import data from UCI HAR Dataset
test_X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")


# get activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")


# get variable columnss for means and stds of measures 
features <- read.table("UCI HAR Dataset/features.txt")
mean_cols <- grep("mean()", features[,2])
std_cols <- grep("std()", features[,2])

# make a list of variable names that combines the mean variables and the std variables 
mean_std_cols <- c(mean_cols, std_cols)
mean_std_cols_sorted <- sort(mean_std_cols)
variable_names=as.vector(features[mean_std_cols_sorted,2])


# combine test tables
# Y_test and Y_train give the code for activity for each measurement, e.g. walking, standing, etc.
test_table <- cbind(subject_test, test_Y_test, test_X_test)


# combine training tables
train_table <- cbind(subject_train, train_Y_train, train_X_train)


# combine test table and training table
combined_table=rbind(test_table, train_table)


# change first two variable names
names(combined_table)[1] <- "subject"
names(combined_table)[2] <- "activity"


# select columns with mean and std data
# first make a function to remove "V" from colnames, then find number of columns in table
remove_v<-function(x){sub("V","",x)}
num_cols=ncol(combined_table)
names(combined_table)[3:num_cols] <- sapply(names(combined_table)[3:num_cols], remove_v)


# adjust mean_std_cols_sorted to account for the fact that I added two columns on the left side of the table
mean_std_cols_sorted=mean_std_cols_sorted+2


# retain only those data columns that contain mean and std data
mean_std_table <- combined_table[,c(1,2, mean_std_cols_sorted)]


# replace variable numbers with variable names
names(mean_std_table)[3:ncol(mean_std_table)] <- as.character(variable_names)
                        
                        
# join activity description
names(activities) <- c("activity","description")
library(plyr)
new_table <- join(mean_std_table,activities)


# move activity description to second column because it is a fixed variable. drop last column.
new_table[,2] <-new_table[,82]
new_table <- new_table[,1:81]


# next - melt this table so that each record has subject, activity, typeofmeasure, mean/std, axis, and value
library(reshape2)
new2 <- melt(new_table, c("subject", "activity"),variable_names)

# separate the activity values into 3 columns
library(tidyr)
new3 <- separate(data=new2, col=variable, into=c("signal","funct","axis"))

# group and summarize data
new4 <- new3 %>%
group_by(subject, activity, signal, funct, axis) %>%
summarize(mean=mean(value))

# make character values into factors
new4$signal <- as.factor(new4$signal)
new4$funct <- as.factor(new4$funct)
new4$axis <- as.factor(new4$axis)

# write out new tidy dataset
write.table(new4, "tidy_measurements.txt")








