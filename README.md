# run_analysis.R
----------------

## What is this?
This is the R script for Getting and Cleaning Data Course Project on Coursera.

1. Unzip original zip file.
1. Merges the training and the test sets to create one data set.?
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How to run.

1. Put the original zip file and this script on your work directory.
1. Run this script.
1. You will get tidy_df.txt file. 

## How this work.

* Read train data
  * Training set data from X_train.txt
  * Training labels data from y_train.txt
  * Subject who performed the activity data from subject_train.txt
  * Add activity and subject to X_train data frame
* Read test data
  * Training set data from X_test.txt
  * Training labels data from y_test.txt
  * Subject who performed the activity data from subject_test.txt
  * Add activity and subject to X_test data frame
* Concatenate X_train and X_test data frame
* Read feature data
* Name colname
* Extract mean() and std()
* Read activity label data from activity_labels.txt
* Name activity factor
* Get rid of "()" in variable names
* Substitute "-" to "_" in variable names
* Melt data frame with subject id and activity id
* Get tidy data frame with the average of each variable for each activity and each subject
* Write text file from tidy_df


