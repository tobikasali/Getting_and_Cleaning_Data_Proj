##Getting and Cleaning data Project


###Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Contents of the Repository


* CodeBook.md - Information about the data set,variables and transformations performed.
* Readme.md - This file, describing the contents of this repo and the analysis.R file.
* Analysis.R - The script to convert the data to tidy data set


###Create a Tidy Data Set

* Download and unzip the data set
* Set your working directory to the UCI HAR Dataset directory.
* Source the analysis.R file. Note: The script requires the plyr and the ddplyr package.
* The script will create a file called tidy_data.txt in your working directory.

###Data Processing

The data was process with the analysis.R script. The following steps were taken:

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
    