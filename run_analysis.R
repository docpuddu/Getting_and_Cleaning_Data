
# run_analysis.R
# Script to performe some data "massage", starting from a bunch of given data files
# regarding spatial movement of a panel of persons equipped with a Samsung Galaxy S II 

# Whole code is not optimized (it takes around 3'min to finish) 
# for learning purpose every block is quite verbose

# 1. step
# Merge the training and the test sets to create one data set

# Read both train and test dataset to merge them up
df1 <- read.csv("test/X_test.txt", header=FALSE, sep="")
df2 <- read.csv("train/X_train.txt", header=FALSE, sep="")
df_tot <- rbind(df1, df2)

# 2. step
# Extract only the measurements on the mean and standard deviation 

#load the features in a data frame
features <- read.csv("features.txt", header=FALSE, sep="")

# Select features related to std() and mean()
index <- c()
for (i in 1:nrow(features)) { 
  #If the i-th string contains "std()" or "mean()" append it to the index 
  if (grepl("std()", features[i,2], fixed=TRUE) | grepl("mean()",features[i,2], fixed=TRUE))
    index <- c(index, i)
}

# Build the Final data frame extracting only the desired columns
df_final <- df_tot[index[1]]

for (j in 2:length(index)) { 
  df_final <- cbind(df_final, df_tot[index[j]])
}

# 3. step
# Use descriptive activity names to name the activities in the data set

# Read both train and test labels to merge them up
dl1 <- read.csv("test/y_test.txt", header=FALSE, sep="")
dl2 <- read.csv("train/y_train.txt", header=FALSE, sep="")
dl_tot <- rbind(dl1, dl2)

#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING

#just inizialise..
row_label <- dl_tot

# then perform a replace 1..6 to relative names
for (k in 1:nrow(dl_tot)) { 
  if (dl_tot[k,] == 1) row_label[k, ] <- "WALKING" else
    if (dl_tot[k,] == 2) row_label[k, ] <- "WALKING_UPSTAIRS" else
      if (dl_tot[k,] == 3) row_label[k, ] <- "WALKING_DOWNSTAIRS" else
        if (dl_tot[k,] == 4) row_label[k, ] <- "SITTING" else
          if (dl_tot[k,] == 5) row_label[k, ] <- "STANDING" else
              #if (dl_tot[k,] == 6) 
                row_label[k, ] <- "LAYING" 
}
# Add description for every row (measurement)
df_final  <- cbind(row_label, df_final)

# 4. step
# Appropriately label the data set with descriptive variable names 
col_label <- c() 

# The first value is the descriptive name "Activity"
col_label[1] <- "activity"

# read the further names from features (see above)
for (h in 2:(length(index) + 1)) { 
  col_label[h] <- as.character(features[index[h-1],2])
}

# Add names (represents the descriptive variable names)
names(df_final) <- col_label

# 5. step 
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# Read both subject train and test to merge them up
ds1 <- read.csv("test/subject_test.txt", header=FALSE, sep="")
ds2 <- read.csv("train/subject_train.txt", header=FALSE, sep="")
ds_tot <- rbind(ds1, ds2)

df_final <- cbind(ds_tot, df_final)
names(df_final) <- c("subject", col_label)

# Order by subject, then by activity
df_final <- df_final[order(df_final$subject, df_final$activity), ]

# just some initialisations
df_result <- c()
subject <- df_final[1,1]
activity <- df_final[1,2]
df_part <- df_final[1, ]
n <- 2

# loop on the rows and pack those with same activity for each subject
while (n < nrow(df_final)) {
  while (subject == df_final[n ,1] & activity == df_final[n, 2] & n <= nrow(df_final)) {
  df_part <- rbind(df_part, df_final[n, ])
  n <- n + 1
  }
  # build line by line the resulting tidy data frame
  dr_row <- c(subject, activity)
  for (g in 3:ncol(df_final)) {
    dr_row <- c(dr_row, mean(df_part[ ,g]))
  }
  df_result <- rbind(df_result, dr_row)
  
  # checks if the end has been reached
  if (n < nrow(df_final)) {
    subject <- df_final[n ,1]
    activity <- df_final[n, 2]
  }
}

write.table(df_result, file="tidy_step5.txt", row.names = FALSE)

