run_analysis <- function() {
  features <- read.table("features.txt", col.names = c("index", "name"))
  activity_labels <- read.table("activity_labels.txt", col.names = c("code", "activity"))
  
  mean_std_idx <- grep("mean\\(\\)|std\\(\\)", features$name)
  mean_std_names <- features$name[mean_std_idx]
  
  x_train <- read.table("train/X_train.txt")[, mean_std_idx]
  colnames(x_train) <- mean_std_names
  y_train <- read.table("train/y_train.txt", col.names = "activity")
  subject_train <- read.table("train/subject_train.txt", col.names = "subject")
  train_data <- cbind(subject_train, y_train, x_train)
  
  x_test <- read.table("test/X_test.txt")[, mean_std_idx]
  colnames(x_test) <- mean_std_names
  y_test <- read.table("test/y_test.txt", col.names = "activity")
  subject_test <- read.table("test/subject_test.txt", col.names = "subject")
  test_data <- cbind(subject_test, y_test, x_test)
  
  all_data <- rbind(train_data, test_data)
  
  all_data$activity <- factor(
    all_data$activity,
    levels = activity_labels$code,
    labels = activity_labels$activity
  )
  
  names(all_data) <- gsub("\\()", "", names(all_data))
  names(all_data) <- gsub("-", "_", names(all_data))
  names(all_data) <- gsub("^t", "time_", names(all_data))
  names(all_data) <- gsub("^f", "freq_", names(all_data))
  names(all_data) <- gsub("Acc", "Accelerometer", names(all_data))
  names(all_data) <- gsub("Gyro", "Gyroscope", names(all_data))
  names(all_data) <- gsub("Mag", "Magnitude", names(all_data))
  names(all_data) <- gsub("BodyBody", "Body", names(all_data))
  
  tidy_data <- aggregate(. ~ subject + activity, data = all_data, FUN = mean)
  tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity), ]
  
  tidy_data
}

tidy_data <- run_analysis()
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)