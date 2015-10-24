# "Getting and Cleaning Data" course project

### Resources:

The data involved represent measures collected from the Samsung Galaxy S II smartphone. 
A panel of 30 persons equipped with a Samsung Galaxy S II performed six action (e.g. walking, sitting, laying... etc) while 
the smartphone was registering spatial movement (by the accelerometer, gyroscope..)

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project (.zip file):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Purpose: 

Create a script called "run_analysis.R" that performs the following five steps:

  1. Merges the training and the test sets to create one data set
  2. Extracts only the measurements on the mean and standard deviation for each measurement
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Instruction to proceed:

  Download the zip data on your local machine and extract it. You'll have a UCI HAR Dataset folder.
  Put run_analysis.R in the UCI HAR Dataset folder, then set it as your working directory using setwd() 
  Run source("run_analysis.R"), then it will generate a new file step5.txt in the current working directory.

### Dependencies

run_analysis.R does not require specific libraries. 

