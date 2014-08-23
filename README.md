The 'Getting and Cleaning Data' PA project
==========================================
##The file contents
This folder contains a zipped dataset [*Human Activity Recognition Using Smartphones Dataset (Version 1.0)*](www.smartlab.ws)  and an R script for extracting the mean and standard deviation values from the dataset and averaging it across all subjects.

####The dataset includes the following files:
- README.md - this file containing a description of all the transformations performed to clean up the original data and produce the resulting tidy dataset
- CodeBook.md - the variables' descriptions, 
- getdata-projectfiles-UCI HAR Dataset.zip - the original data

##The steps performed to obtain the aggregated tidy data set:
1. unzip the original data file (provided it exists in the directory from which the script is called)
2. read the files containing the names of measured variables (*features.txt*) and the activity type labels (*'activity_labels.txt'*)
3. edit the strings read from 'features.txt' so that they may be used for column names (remove '(' and ')' characters, replace '-' with '_'); highlight the names for means and standard deviations with capital letters.
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




