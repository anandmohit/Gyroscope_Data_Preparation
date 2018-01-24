## **Overview**

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at  [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

- README.md, this file, which provides an overview of the data set and how it was created.
- tidy\_data.txt, which contains the data set.
- CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
- run\_analysis.R, the R script that was used to create the data set (see the  [Creating the data set](https://github.com/spujadas/getting-and-cleaning-data-course-project/blob/master/README.md#creating-data-set) section below)

## **Creating the data set**

The R script run\_analysis.R can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps:

- Download and unzip source data if it doesn&#39;t exist.
- Read data.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the tidy\_data.txt file.

The tidy\_data.txt in this repository was created by running the run\_analysis.R script
