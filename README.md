# Readme

## Contents:
* *'README.md'*
* *'run_analysis.R'*: must be launched in *'UCI HAR Dataset'* working directory.
	Reads files from *'UCI HAR Dataset\train'* and *'UCI HAR Dataset\test'* directories
	and saves to working directory *'finalTable.txt'* Requires *'data.table'* package.
* *'CodeBook.md'*: describes variables

## The Raw data

Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

Check *'README.txt'* and https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for further details about this dataset.

### For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Analisys
1. Download the dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip dataset
3. Run *'run_analysis.R'* with *'UCI HAR Dataset'* working directory (install.packages("data.table") if needed)

### *run_analysis.R* process:
1. Loads activity labels (*'activity_labels.txt'*) and feature labels (*'features.txt'*).
2. Loads and merges lists of subjects (*'test\subject_test.txt'* and *'train\subject_train.txt'*),
	feature data (*'test\X_test.txt'* and *'train\X_train.txt'*) and activity data (*'test\y_test.txt'* and *'train\y_train.txt'*).
3. Extracts indices of required features: mean() and std().
4. Subsets feature labels and measurements in accordance with the indices.
5. Renames the variables, adds subject numbers and activity labels.
6. Create tidy data set (*'finalTable.txt'*) with the average of each variable for each activity and each subject.