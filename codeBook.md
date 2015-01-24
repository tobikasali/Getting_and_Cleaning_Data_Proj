---
title: "CodeBook"
author: "Tobi Kasali"
date: "23 January 2015"
output: html_document
---


##Getting and Cleaning Data Project

The Data is from the Human Activity Recognition Using Smartphones Dataset and is used for the Getting and cleaning data project.

Source Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


##Data Set Information

This section contains the Description of the data set, the variables and the transformations performed on the data.

### Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Variables

The variables for the Data set are:

 
* A 561-feature vector with time and frequency domain variables - This shows the varibles that were measured.
  
  Some of the variables estimated include:
  
    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
    
    Some of the measurements on these variables include:
    
    mean(): Mean value
    std(): Standard deviation
    mad(): Median absolute deviation 
    max(): Largest value in array
    min(): Smallest value in array


* The activity label - That shows the activities carried out.  
* An identifier of the subject who carried out the experiment.


### Data Processing

The data was process with the analysis.R script. The following steps were taken:

 1. Merge the training and the test sets to create one data set.
   + Read in the data from test and train files
   + Assigin column names to imported Data
   + Merge Train and Test Data.
   
 2. Extract only the measurements on the mean and standard deviation for each measurement. 
 
   + Use Pattern Matching functions like grepl to extrract the mean and standard deviation variables.
    
 3. Use descriptive activity names to name the activities in the data set
   
   + Use Cbind functions to add the activity labels to the data set. Also removed the redundant Activity_ID
      Column. Use dplyr functions rename,select.
      
 4. Appropriately label the variables with descriptive names.
 
   + Use Pattern replacing functions like gsub to amend the variable labels to descriptive labels.
    
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each   subject.
 
   + Used the ddply function to add the sums of the required variables grouped by subject and activity.
    
  

