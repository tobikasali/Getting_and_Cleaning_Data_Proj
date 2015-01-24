# Clean up workspace
##rm(list=ls())
require(plyr)
require(dplyr)


###1. Merge the training and the test sets to create one data set.##########

##Read Data from files####

## get and set working directory(This is the directory where the dataset has been unzipped)

get <- getwd() 
setwd(get) 

## Read features data

feature <- read.table("features.txt", header= FALSE)
activity_labels <- read.table("activity_labels.txt", header=FALSE)

###Read Test Data

test_labels <- read.table('./test/y_test.txt', header= FALSE)
test_data <- read.table('./test/X_test.txt', header= FALSE)
test_subject <- read.table('./test/subject_test.txt', header= FALSE)

# Assigin column names 

colnames(test_labels)   = "Activity_Id";
colnames(test_data)     =  feature[,2]; 
colnames(test_subject)  = "SubjectId";



## Read the training data

train_labels <- read.table('./train/y_train.txt', header= FALSE)
train_data <- read.table('./train/X_train.txt', header= FALSE)
train_subject <- read.table('./train/subject_train.txt', header= FALSE)

##Assign column names to train data

colnames(train_labels)   = "Activity_Id";
colnames(train_data)     = feature[,2]; 
colnames(train_subject)  = "SubjectId"




##Assign Column names

colnames(activity_labels) = c("Activity_Id", "Activity")


## Create clean test and train data set

c_test_data  <- cbind(test_subject, test_labels,test_data)
c_train_data <- cbind(train_subject,train_labels,train_data)

## Combine to form one data set

my_comp_data <- rbind(c_test_data,c_train_data)

## Get column names for Q2.

getNames <- colnames(my_comp_data)


###2. Extract only the measurements on the mean and standard deviation for each measurement.###

my_sel_data <- my_comp_data[,grepl("Activity_Id|SubjectId|mean|std", getNames)]


###3. Use descriptive activity names to name the activities in the data set. ###

my_sel_data <- merge(my_sel_data,activity_labels, by="Activity_Id")
my_sel_data <- select(my_sel_data, -contains("Activity_Id"))

###4. Appropriately label the data set with descriptive variable names. 

colnames(my_sel_data) <- gsub("[[:punct:]]", " ", colnames(my_sel_data))
colnames(my_sel_data) <- gsub("^t", "time ", colnames(my_sel_data))
colnames(my_sel_data) <- gsub("^f", "frequency ", colnames(my_sel_data))
colnames(my_sel_data) <- gsub('std',' StdDev', colnames(my_sel_data))
colnames(my_sel_data) <- gsub("mean"," Mean", colnames(my_sel_data))
colnames(my_sel_data) <- gsub('Mag'," Magnitude ", colnames(my_sel_data))
colnames(my_sel_data) <- gsub("Acc", " Acceleration ", colnames(my_sel_data))
colnames(my_sel_data) <- gsub("Gyro"," Gyro " , colnames(my_sel_data))
colnames(my_sel_data) <- gsub("Jerk"," Jerk " , colnames(my_sel_data))


#my_sel_data <- rename(my_sel_data, SubjectId = Subject)


###5.Creates a second,independent tidy data set with the average of each variable for each activity and each subject.

my_tidy_data = ddply(my_sel_data, c("SubjectId","Activity"), numcolwise(mean))
write.table(my_tidy_data, file = "./tidy_data.txt")