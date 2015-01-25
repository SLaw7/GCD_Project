# GCD_Project Overview

The script "run_analysis.R" does the following:

1. Merges the training and the test sets to create one data set called "data1".
2. Extracts only the measurements on the mean and standard deviation for each measurement to a data set called "data2".
3. Uses descriptive activity names to name the activities in a data set called "data3".
4. Appropriately labels the data set with descriptive variable names in a data set called "data4".
5. From the data4, creates "data5", independent tidy data set with the average of each variable for each activity and each subject.
6. Prints data5

IMPORTANT: Need to load "dplyr" package before running script.

# GCD_Project Details (by step)

1. Reads relevant data, creates data sets: test and train, the first column is the subject, the middle columns are the feature data, and the last column is the activity label, merge the training and the test sets to create one data set
2. create vector with column numbers of veriables that include "mean()" or "std()", extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set by merging data2 and the activity labels
4. create vector of column names from feature data, humanize the column names, redefined the names of the columns in data3
5. create a second, independent tidy data set with the average of each variable for each activity and each subject
