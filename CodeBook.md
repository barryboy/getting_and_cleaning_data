The Code Book
=============
##The steps performed to obtain the aggregated tidy data set:
1. unzip the original data file (provided it exists in the directory from which the script is called)
2. read the files containing the names of measured variables (*features.txt*) and the activity type labels (*'activity_labels.txt'*)
3. edit the strings read from 'features.txt' so that they nay be used for column names (remove '(' and ')' characters, replace '-' with '_'); highlight the names for means and standard deviations with capital letters.
4. read test and training datasets from UCI *'./HAR Dataset/test/X_test.txt'* and *'./UCI HAR Dataset/train/X_train.txt'* respectively, and label their columns with names read from *'features.txt'*
5. read the activity names vectors for test and training datasets (*'y_test.txt'*,*'y_train.txt'*) and attach them as columns *'activity'* to the appropriate data sets
6. replace numeric values in the *'activity'* column with the names read from *'activity_labels.txt'*
7. read the subjects' numbers vectors for test and training datasets (*'subject_test.txt'*, *'subject_train.txt'*)
8. attach the subjects vectors to both data frames
9. join the *'train'* and *'test'* data frames by collating them with *rbind* function
10. pick from the obtained dataset the columns with subject number and activity name and those containing the infrmation on means and standard deviations (previously marked with capital letters)
11. create a new data set by aggregating the data by *'subject'* and *'activity'* columns, using the *'mean'* function
12. sort the rows by *'subject'* and *'activity'* columns
13. save the data frame in the file "averaged_data.txt"


##The variables:
Below is the list of all variables contained in the data set:

- **subject** - a subject number
- **activity** - the performed activity name

The following variables come in the form of sets, where the prefixes signify mean or standard deviation value and, for some variables, the X, Y and Z coordinates:

- tBodyAcc_{MEAN,STD}_{X,Y,Z}
- tGravityAcc_{MEAN,STD}_{X,Y,Z}
- tBodyAccJerk_{MEAN,STD}_{X,Y,Z}
- tBodyGyro_{MEAN,STD}_{X,Y,Z}
- tBodyGyroJerk_{MEAN,STD}_{X,Y,Z}
- tBodyAccMag_{MEAN,STD}
- tGravityAccMag_{MEAN,STD}
- tBodyAccJerkMag_{MEAN,STD}
- tBodyGyroMag_{MEAN,STD}
- tBodyGyroJerkMag_{MEAN,STD}
- fBodyAcc_{MEAN,STD}_{X,Y,Z}
- fBodyAccJerk_{MEAN,STD}_{X,Y,Z}
- fBodyGyro_{MEAN,STD}_{X,Y,Z}
- fBodyAccMag_{MEAN,STD}
- fBodyAccJerkMag_{MEAN,STD}
- fBodyGyroMag_{MEAN,STD}
- fBodyGyroJerkMag_{MEAN,STD}
