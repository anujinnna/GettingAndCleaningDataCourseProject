# Getting and Cleaning Data - Course Project

This repository contains the files for the course project of
the "Getting and Cleaning Data" course.

- `run_analysis.R` contains the R code that reads the UCI HAR Dataset,
  merges the training and test sets, extracts mean and standard deviation
  variables, renames the activities and variables, and creates a tidy data
  set with the average of each variable for each activity and each subject.
- `CodeBook.md` describes the variables and the transformations applied
  to the data.
- The script assumes that the folder `UCI HAR Dataset` is the working
  directory and that all the original data files are unchanged.

To run the analysis:

1. Set the working directory to the folder `UCI HAR Dataset`.
2. Place `run_analysis.R` inside this folder.
3. In R, run:

   ```r
   source("run_analysis.R")
