# CodeBook

This code book describes the tidy data set created from the
UCI HAR Dataset.

Source: Human Activity Recognition Using Smartphones Data Set.

The script `run_analysis.R` merges the training and test sets,
keeps only the mean and standard deviation measurements, applies
descriptive activity names, and labels the variables with descriptive
names.

Variables:
- `subject`: integer, 1–30, ID of the subject.
- `activity`: factor with 6 levels
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
   SITTING, STANDING, LAYING).

All other variables are numeric and represent the average of the
original mean and standard deviation measurements for each subject
and each activity.
