# Input data

The data needs to be downloaded and unzipped into the source directory of the script for the script to work.

Data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of the data can be found here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Input files

The data needs to be downloaded into the source directory of the script for the script to work.
The needed files are:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

# Output data

The output file "tidy_data.txt" is the data set with the average of each variable for each activity and each subject

# Transformations

This is what the script does:
First, the data is read, and merged into one single data set (variable "all_data").

Second, the mean and standard deviation for each measurement are extracted into a separate variable ("all_data_ms").

Third, a new tidy data set is created with the average of each variable for each activity and each subject. This data set is created by applying MELT and CAST functions. This data set is saved into the variable "means"
This data set is exported to a file named "tidy_data.txt". This file can be read for later analysis. Please note that row names are not included. In case they're needed it's possible to reprint the table, setting row.name=TRUE
