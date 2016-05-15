library(data.table)

## Steps 1-4
# loading labels
activityLabels <- fread("activity_labels.txt")
featureLabels <- fread("features.txt")

# loading and binding train and test files
subjects <- rbind(fread("test/subject_test.txt"), fread("train/subject_train.txt"))
featureMeasurements <- rbind(fread("test/X_test.txt"), fread("train/X_train.txt"))
activities <- rbind(fread("test/y_test.txt"), fread("train/y_train.txt"))

# extracting indices of required features: mean() and std()
featureIndices <- grep(x = featureLabels$V2, pattern = "(mean\\(\\)|std\\(\\))")

# subsetting feature labels and measurements in accordance with the indices
neededFeatures <- featureLabels[featureIndices, ]
neededMeasurements <- featureMeasurements[,featureIndices, with = FALSE]

# renaming variables
setnames(neededMeasurements, tolower(neededFeatures[[2]]))

# adding subject numbers and activity labels
neededMeasurements[, subject:= subjects]
neededMeasurements[, activity:= tolower(merge(activities, activityLabels, by = "V1",
                                              sort = FALSE)$V2)]

## Step 5
#  averaging columns subsetted by subject and activity and 
finalTable <- neededMeasurements[, lapply(.SD, mean), by=list(subject, activity)]

# reordering in accordance with subject number
setorder(finalTable, subject)

# saving
write.table(x = finalTable, file = "finalTable.txt", row.names = FALSE)
