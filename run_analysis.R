# Load packages
library(dplyr)

# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Read feature names
features <- read.table("UCI HAR Dataset/features.txt")
colnames(x_data) <- features$V2

# Extract mean and std columns
mean_std_columns <- grepl("mean\\(\\)|std\\(\\)", features$V2)
x_data <- x_data[, mean_std_columns]

# Add subject and activity
data <- cbind(subject_data, y_data, x_data)
colnames(data)[1:2] <- c("subject", "activity")

# Read activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, levels = activity_labels$V1, labels = activity_labels$V2)

# Create tidy dataset
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Save tidy dataset
write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)
