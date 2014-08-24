#libraries
library(data.table)
library(reshape2)
#read train data set, labels, and subjects
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subjects_train <- read.table("train/subject_train.txt")

#read test data set, labels, and subjects
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subjects_test <- read.table("test/subject_test.txt")

#read activity label names
activity_labels<-read.table("activity_labels.txt")
setnames(activity_labels, c("V1","V2"),c("activity","activity_name"))

#read features names
features<-read.table("features.txt")

# REQUIREMENT 1: Merges the training and the test sets to create one data set.
#concatenate data set rows
X_tt <- rbind(X_train, X_test)

#REQUIREMENT 4: Appropriately labels the data set with descriptive variable names. 
setnames(X_tt, as.character(features[,2]))
#concatenate subjecs rows
subjects_tt <- rbind(subjects_train, subjects_test)
setnames(subjects_tt, "V1","subject")
#concatenate labels rows
y_tt <- rbind(y_train, y_test)
setnames(y_tt, "V1","activity")

# REQUIREMENT 3: Uses descriptive activity names to name the activities in the data set
# descriptive names have been merged previously (line 31). The all_data
activity <- merge(y_tt, activity_labels, by = "activity")[,2]
#concatenate columns
# this table already includes R1, R3 and R4
all_data <- cbind(subjects_tt,activity,X_tt)

# REQUIREMENT 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
ms <- grepl("mean\\(\\)|std\\(\\)", names(all_data))
all_data_ms <- (all_data[,ms])

#REQUIREMENT 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
melted <- melt(all_data, id.var=c("subject", "activity"))
means = dcast(melted , subject + activity ~ variable, mean)
write.table(means, file="tidy_data.txt", row.name=FALSE)