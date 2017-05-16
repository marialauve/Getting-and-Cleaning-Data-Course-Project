## Course 3: Getting and Cleaning Data
## Week 4 Graded Programming Assignment

## Documentation
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Download data from website
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./activity.zip",mode="wb")
if(!file.exists("./activity")){dir.create("./data/activity")}
unzip("./activity.zip",list=TRUE)
unzip("./activity.zip",exdir="./activity")

## Read in data files

x_test <- read.table("./activity/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./activity/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./activity/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./activity/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./activity/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./activity/UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./activity/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./activity/UCI HAR Dataset/activity_labels.txt")

## body_acc_x_train <- read.table("./activity/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
## View(body_acc_x_train)
## dim(body_acc_x_train)

## View(x_test); dim(x_test)
## View(y_test); dim(y_test)
## View(subject_test); dim(subject_test)

## View(x_train); dim(x_train)
## View(y_train); dim(y_train)
## View(subject_train); dim(subject_train)

## View(features); dim(features)
## View(activity_labels); dim(activity_labels)

## (3) Appropriately label the data set with descriptive variable names.
## ****************************************************************
names(x_test) <- features[,2]
names(x_train) <- features[,2]
names(y_test) <- c("activity")
names(y_train) <- c("activity")
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")
names(activity_labels) <- c("activity_code","activity_label")

## (1) Merge the training and the test sets to create one data set.
## ****************************************************************
test <- cbind(subject_test,y_test,x_test)
train <- cbind(subject_train,y_train,x_train)
combined <- rbind(test,train)
dim(combined)

## (4) Use descriptive activity names to name the activities in the data set.
## **************************************************************************
combined2 <- merge(combined,activity_labels,by.x="activity",by.y="activity_code")
dim(combined2)
names(combined2)

## (2) Extract only the measurements on the mean and standard deviation for each measurement.
## **************************************************************************
select <- combined2[,grep("subject|activity|-mean|-std",names(combined2),ignore.case=T)]
View(select); dim(select)

##library(dplyr)
select_sort <- arrange(select,subject,activity)
View(select_sort)

## (5) From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject.
## **************************************************************************
select_summ <- select_sort %>% group_by(subject,activity_label) %>% summarize_each(funs(mean))
View(select_summ)

## Write data to output txt file
write.table(select_summ,file="./activity/FitnessData.txt",row.names=FALSE)

## END
## **************************************************************************
## **************************************************************************
