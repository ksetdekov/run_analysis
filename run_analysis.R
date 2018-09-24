### this is an analytic script 

##1 Merges the training and the test sets to create one data set. 

##2 Extracts only the measurements on the mean and standard
##deviation for each measurement. 

##3 Uses descriptive activity names to name the activities in the data set 

##4 Appropriately labels the data set with descriptive variable names. 

##5 From the data set in step 4, creates a second, independent tidy data set
##with the average of each variable for each activity and each subject.

## reading data
library(readr)
X_test <- read_table2("UCI HAR Dataset/test/X_test.txt", 
                      col_names = FALSE)
subject_test <- read_csv("UCI HAR Dataset/test/subject_test.txt", 
                         col_names = FALSE)
y_test <- read_csv("UCI HAR Dataset/test/y_test.txt", 
                   col_names = FALSE)

X_train <- read_table2("UCI HAR Dataset/train/X_train.txt", 
                       col_names = FALSE)
subject_train <- read_csv("UCI HAR Dataset/train/subject_train.txt", 
                          col_names = FALSE)
y_train <- read_csv("UCI HAR Dataset/train/y_train.txt", 
                    col_names = FALSE)

features <- read_table2("UCI HAR Dataset/features.txt", 
                        col_names = FALSE)
activity_labels <- read_table2("UCI HAR Dataset/activity_labels.txt", 
                               col_names = FALSE)


