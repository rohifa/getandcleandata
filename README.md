coursera-gettingandcleaningdata
===============================

Getting And Cleaning Data course project


Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data needs to be downloaded into the source directory of the script for the script to work.

 The script run_analysis.R does the following:

The first part load the data and creates a unique data set, merging and labeling the data with descriptive names and assigning the correct names to the variables (Requirements 1,3,4).
In order:
* data is loaded
* descriptive names are assigned to the variables (R4)
* descriptive activity names are assigned to the activities performed (R3)
* a single data set is created, with all the variables name assigned and the activity labels in their descriptive form. The final variable name is called "all_data" (R1)

In the second part are extracted only the measurements on the mean and standard deviation for each measurement (Requirement 2). 
This is saved in a variable called "all_data_ms"

In the third part a tidy data set with the average of each variable for each activity and each subject (Requirement 5). The tidy data set is then exported to a text file called "tidy_data.txt", in the working directory.

## Requirements

2 packages are required: data.table and reshape2