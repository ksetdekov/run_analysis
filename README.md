# run_analysis
Analyses of run data for Coursera course 
This file in the repo explains how all of the scripts work and how they are connected

A folder named "UCI HAR Dataset" must be located in the active directory.

This folder is unzipped data from the dataset located behind this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Code in _run_analysis.R_ runs according to the task steps:
## Preparation, Step 0 ##
1. libraries for reading files and dlyr are loaded

`library(readr)
library(dplyr)`

2. test data is read into _X_test, subject_test and y_test_ data frames
3. train data is read into _X_train, subject_train and y_train_ data frames
4. information about feature labels and acitvity labels are read into _features_ and _activity_labels_

## Merding, Step 1 ##
5. because there are now keys, we assume that X, subject and Y data is ordered correctly and merge test and train data into _X, subject and Y_ using _bind_rows_

`X <- bind_rows(X_test, X_train)`

`subject <- bind_rows(subject_test, subject_train)`

`Y <- bind_rows(y_test, y_train)`
6. unmerged test and train data is removed
`rm(X_test, X_train)`

`rm(subject_test, subject_train)`

`rm(y_test, y_train)`

## Extracting data, Step 2 ##
According to the task:
>Extracts only the measurements on the mean and standard deviation for each measurement
7. Column names were assigned from the values of _features_:
`X <- X %>% setNames(namesvector) ## naming for step 4`
8. from the whole list of columns in _X_ only those which had _mean()_ or _std()_ in their label were extracted using regular expressions

`clean <- X[, grepl("((.*)-mean\\()|((.*)-std\\()", colnames(X))]`

## Adding activit labels, Step 3 ##
According to the task:
>Uses descriptive activity names to name the activities in the data set
_Y_ has acivity codes and _acitvity_labels_ has activity discription in string format.
### Adding activity info ###
9. Activity labels were left_joined to the acivity values

`labeledact <- left_join(Y, activity_labels, by = c("X1" = "X1"))`

10. acitvity values were removed `labeledact <- (labeledact[, 2])`
11. acitvity label column _labeledact_ were given a name _activity_ 

`labeledact <- labeledact %>% setNames("activity") ## naming for step 4`

12. acitivity data was joined to the left of the clean data

`clean <- labeledact %>% bind_cols(clean)`
### Adding subject info ###
13. Subject ID's were called _subject_

`subject <- subject %>% setNames("subject") ## naming for step 4`

14. subject ID's were added to the clean data set:

`clean <- subject %>% bind_cols(clean)`

15. unneeded data was removed 

`rm(activity_labels,features,labeledact,subject,Y)`

## Extracting data, Step 4 ##
>Appropriately labels the data set with descriptive variable names.
This has already been done on steps 7, 12, 13

## Creating separate clean set with summary, Step 4 ##
> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This was carried out in a single command by piping:
16. clean data (_clean_) was grouped by _subject,activity_ and averages for all columns were calculated were calculated with respect to this grouping

`result <- clean %>% group_by(subject,activity) %>% summarise_all(funs(mean))`

17. final result was  saved to a .txt

`write.table(result, file = "result.txt",row.name=FALSE)`
