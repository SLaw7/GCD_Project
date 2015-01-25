The output from running "run_analysis.R" is a data set called data5. 

This data set has 6 rows dorresponding to the 6 activities measured in the UCI HAR Dataset: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

This data set has 67 columns, other than the column indicating the row names. 66 of those columns correspond to the variables measured in the UCI HAR Dataset that include either "mean()" or "std()". The remaining column corresponds to the Subject ID number in the UCI HAR Dataset.

An entry in the ith row and jth column (for j>2) of the data5 dataset, is the average of all the data collected in the ith activity about the jth feature or ID Number. (Note that averaging the ID numbers is not very useful information)
