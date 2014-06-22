#
# run_analysis.R
#

# unzip original zip file
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# Read train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Add activity and subject to X_train data frame
X_train$activity <- y_train$V1
X_train$subject <- subject_train$V1

# Read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Add activity and subject to X_test data frame
X_test$activity <- y_test$V1
X_test$subject <- subject_test$V1

# Concatenate X_train and X_test
X1 <- rbind(X_train, X_test)

# Read feature data
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

# Name colnames
colnames(X1) <- c(features$V2,"activity","subject")

# Extract mean() and std()
X2 <- X1[,c(grep("mean\\(\\)|std\\(\\)",features$V2))]
X3 <- cbind(X2, X1[,c("activity","subject")])

# Encode activity and subject vector as factor
X3$activity <- as.factor(X3$activity)
X3$subject <- as.factor(X3$subject)

# Read activity label data
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

# Name activity factor
levels(X3$activity) <- act_labels$V2

# Modify variable names
names(X3) <- gsub("\\(\\)", "", names(X3))
names(X3) <- gsub("-", "_", names(X3))

# Melt data frame with subject id and activity id
library(reshape2)
X4 <- melt(X3,id=c("subject","activity"))

# Get tidy data frame with the average of each variable
# for each activity and each subject
tidy_df <- dcast(X4, subject + activity ~ variable, mean)

# Write text file from tidy_df
write.table(tidy_df, file="tidy_df.txt", quote=FALSE, row.names=FALSE)
