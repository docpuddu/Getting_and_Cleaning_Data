# CodeBook

This is a code book for "Getting and Cleaning Data" course by Coursera

It describes the data, before and after the transformations performed by the run_analysis.R script 


## The raw data (source data)

The data derives from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Transformation performed by run_analysis.R

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## The resulting data (tidy data)

The final data set is thus a subset of the original columns (only those related to the mean and standard deviation attributes) 
plus two additional columns that identify the activity and each subject that performed it.

More in detail:

- V1: the subject (identifies a volunteer from 1 to 30) 
- V2: the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Following V3..V68 are the desidered average of each variable for each activity and each subject where "variable" stand for those original columns related to mean and standard deviation of measurement

- V3,V4,V5 average of rispectively tBodyAcc-mean()-X,Y,Z
- V6,V7,V8 average of rispectively tBodyAcc-std()-X,Y,Z
- V9,V10,V11 average of rispectively tGravityAcc-mean()-X,Y,Z
- V12,V13,V14 average of rispectively tGravityAcc-std()-X,Y,Z
- V15,V16,V17 average of rispectively tBodyAccJerk-mean()-X,Y,Z
- V18,V19,V20 average of rispectively tBodyAccJerk-std()-X,Y,Z
- V21,V22,V23 average of rispectively tBodyGyro-mean()-X,Y,Z
- V24,V25,V26 average of rispectively tBodyGyro-std()-X,Y,Z
- V27,V28,V29 average of rispectively tBodyGyroJerk-mean()-X,Y,Z
- V30,V31,V32 average of rispectively ttBodyGyroJerk-std()-X,Y,Z
- V33 average of tBodyAccMag-mean()
- V34 average of tBodyAccMag-std()
- V35 average of tGravityAccMag-mean()
- V36 average of tGravityAccMag-std()
- V37 average of tBodyAccJerkMag-mean()
- V38 average of tBodyAccJerkMag-std()
- V39 average of tBodyGyroMag-mean()
- V40 average of tBodyGyroMag-std()
- V41 average of tBodyGyroJerkMag-mean()
- V42 average of tBodyGyroJerkMag-std()
- V43,V44,V45 average of rispectively fBodyAcc-mean()-X,Y,Z
- V46,V47,V48 average of rispectively fBodyAcc-std()-X,Y,Z
- V49,V50,V51 average of rispectively fBodyAccJerk-mean()-X,Y,Z
- V52,V53,V54 average of rispectively fBodyAccJerk-std()-X,Y,Z
- V55,V56,V57 average of rispectively fBodyGyro-mean()-X,Y,Z
- V58,V59,V60 average of rispectively fBodyGyro-std()-X,Y,Z
- V61 average of fBodyAccMag-mean()
- V62 average of fBodyAccMag-std()
- V63 average of fBodyBodyAccJerkMag-mean()
- V64 average of fBodyBodyAccJerkMag-std()
- V65 average of fBodyBodyGyroMag-mean()
- V66 average of fBodyBodyGyroMag-std()
- V67 average of f fBodyBodyGyroJerkMag-mean()
- V68 average of f fBodyBodyGyroJerkMag-std()
