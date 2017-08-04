##PROJECT GETTING AND CLEANING DATA

setwd("C:/Datos/Coursera/Getting and Cleaning Data/Week4")

#download zip file containing the datasets
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "wearable.zip")
#unzip it
unzip(zipfile = "wearable.zip")

#load complementary information
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
feature_names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

#load test and train data
test_features <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
names(test_features) <- feature_names[,2]
test_labels <- merge(test_labels, activity_names, by = "V1")
test_labels$V1 <- NULL
names(test_labels) <- "activity"
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(test_subjects) <- "subject"

train_features <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
names(train_features) <- feature_names[,2]
train_labels <- merge(train_labels, activity_names, by = "V1")
train_labels$V1 <- NULL
names(train_labels) <- "activity"
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(train_subjects) <- "subject"

#we will now perform the steps we are asked to do in the assigment description
# 1.Merges the training and the test sets to create one data set.
#4we start by mergin the different components of train and test datasets, and
#then merging them together
test <- cbind(test_labels, test_subjects)
test <- cbind(test, test_features)
train <- cbind(train_labels, train_subjects)
train <- cbind(train, train_features)

data <- rbind(train,test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# mean is represented by mean(), and standard deviation by std()
# we find the columns that either have mean or std in their names
col <- sort(c(grep("mean()", names(data)),grep("std()", names(data))))
stdmean <- data[,c(1,2,col)]


# 3.Uses descriptive activity names to name the activities in the data set
#this step was already performed along with step #1

# 4.Appropriately labels the data set with descriptive variable names.
#this step was already performed along with step #1

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
groupeddata <- group_by(stdmean, subject, activity)
tidydata <- summarize_all(groupeddata, funs(mean))
rm(list=setdiff(ls(), c("tidydata", "stdmean"))) #cleans workspace

write.table(stdmean, file = "C:/datos/repos/GettingCleaningDataCourseraProject/stdmean.txt",
            row.names = FALSE)
write.table(tidydata, file = "C:/datos/repos/GettingCleaningDataCourseraProject/tidydata.txt",
            row.names = FALSE)


