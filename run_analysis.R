# Note: data_i is the data set requested in part i of the Project

# Note: requires "dplyr" package

# begin by reading data
testSUB <- read.table("./test/subject_test.txt")
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/Y_test.txt")

trainSUB <- read.table("./train/subject_train.txt")
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/Y_train.txt")

features <- read.table("./features.txt")
act_lab <- read.table("./activity_labels.txt")


## 1

# create data sets for both the "test" data and the "train" data
# the first column is the subject, the middle columns are the feature data, and the last column is the activity label
test <- cbind(testSUB, testX, testY)
train <- cbind(trainSUB, trainX, trainY)

#merge the training and the test sets to create one data set
data1 <- rbind(test,train)


## 2

# create vector with column numbers of veriables that include "mean()" or "std()"
mean_or_sum <- as.numeric(c(grep("mean()",features$V2,fixed=TRUE), grep("std()",features$V2,fixed=TRUE)))
# put these column numbers in numerical order, and add 1 (because the subject column shifts all of these column numbers by 1)
columns_with_mean_or_sum <- sort(mean_or_sum+1)
# extract only the measurements on the mean and standard deviation for each measurement
data2 <- data1[ ,c(1, columns_with_mean_or_sum, 563)]


## 3

# Use descriptive activity names to name the activities in the data set
mergeData = merge(data2,act_lab,by.x="V1.2", by.y="V1", all=TRUE)
# remove first column, it is the index for activity names, thus it is redundant
data3 <- mergeData[ , 2:69]


## 4

# clean up columnnames
data3<-rename(data3, ID=V1, V1=V1.1, V2=V2.x, Activity_Label=V2.y)
# create vector of column names from feature data
DecVarNames <- features[mean_or_sum,2]
# the following code is like "find" and "replace" in a text editor
from <- c("tBody","tGravity","fBody","-","mean()","std()","Acc","BodyBody")
to <- c("TimeBody","TimeGravity","FrequencyBody","","Mean","StandardDeviation","Accelerometer","Body")
gsub2 <- function(pattern, replacement, x, ...) {
  for(i in 1:length(pattern))
    x <- gsub(pattern[i], replacement[i], x, ...)
  x
}
DecVarNames <- gsub2(from, to, DecVarNames,fixed=TRUE)
#make character vector syntactically valid to be column names
DecVarNames <-make.names(DecVarNames, unique=TRUE)
#redefind the names of the columns in data3
colnames(data3)<- c("ID",DecVarNames,"Activity_Label")
# Appropriately label the data set with descriptive variable names. 
data4<-data3


## 5

# create a second, independent tidy data set with the average of each variable for each activity and each subject
data5<- data4 %>% group_by(Activity_Label) %>% summarise_each(funs(mean))
# output tidy data set requested for project
print(data5)
