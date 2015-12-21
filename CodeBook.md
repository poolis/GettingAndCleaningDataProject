# Code Book for Getting and Cleaning Data project

## Study design

The [data set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for this study was obtained from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/index.html).  

## Data layout

The data set consists of one file, ```tidydataset.txt```, that was derived from the original UCI data with the following transformations:

1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please see ```run_analysis.R``` for exact details of the transformations.  ```README.md`` describes how to run this script.

### tidydataset.txt

#### Column definitions

| Column | Description | 
|--------|-------------|
| subject|Identifier for the subject for the observation |
| activity | Activity for the observation |
| variable | Variable for this observation |
| value    | Value of the variable for this observation |

#### Variable descriptions

| Variable | Descriptions |
|----------|--------------|
| tGravityAccMag.std.. | Time domain GravityAccMag std normalized to [-1, 1]. |
| tBodyAccJerkMag.mean.. | Time domain BodyAccJerkMag mean normalized to [-1, 1]. |
| tBodyAccJerkMag.std.. | Time domain BodyAccJerkMag std normalized to [-1, 1]. |
| tBodyGyroMag.mean.. | Time domain BodyGyroMag mean normalized to [-1, 1]. |
| tBodyGyroMag.std.. | Time domain BodyGyroMag std normalized to [-1, 1]. |
| tBodyGyroJerkMag.mean.. | Time domain BodyGyroJerkMag mean normalized to [-1, 1]. |
| tBodyGyroJerkMag.std.. | Time domain BodyGyroJerkMag std normalized to [-1, 1]. |
| fBodyAccMag.mean.. | Frequency domain BodyAccMag mean normalized to [-1, 1]. |
| fBodyAccMag.std.. | Frequency domain BodyAccMag std normalized to [-1, 1]. |
| fBodyBodyAccJerkMag.mean.. | Frequency domain BodyBodyAccJerkMag mean normalized to [-1, 1]. |
| fBodyBodyAccJerkMag.std.. | Frequency domain BodyBodyAccJerkMag std normalized to [-1, 1]. |
| fBodyBodyGyroMag.mean.. | Frequency domain BodyBodyGyroMag mean normalized to [-1, 1]. |
| fBodyBodyGyroMag.std.. | Frequency domain BodyBodyGyroMag std normalized to [-1, 1]. |
| fBodyBodyGyroJerkMag.mean.. | Frequency domain BodyBodyGyroJerkMag mean normalized to [-1, 1]. |
| fBodyBodyGyroJerkMag.std.. | Frequency domain BodyBodyGyroJerkMag std normalized to [-1, 1]. |
