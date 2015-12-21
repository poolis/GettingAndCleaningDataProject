# GettingAndCleaningDataProject

For this project, a tidy dataset is created from the Human Activity Recognition Using Smartphone [data set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/index.html).  

## How to create the tidy dataset

In order to create the tidy dataset, please follow this set of instructions.

### Dependencies

Please note that the ```plyr``` and ```reshape2``` packages are required.  To install that package, run this command:

```r
> install.packages("plyr")
> install.packages("reshape2")
```

### Create tidy data set
To create the tidy data set, simply source run_analysis.R like so:

```r
> source(run_analysis.R)
```

```run_analysis.R``` will download the source dataset if it does not exist in the current working directory.  It will extract the dataset and run transformations as follows:

1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file ```tinydataset.txt``` will be written to the current working directory.
