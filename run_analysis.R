run_analysis <- function(){
        # 1. UNZIPPING THE DATA
        filename <- "getdata-projectfiles-UCI HAR Dataset.zip"
        if(file.exists(filename)){
                unzip(filename)
        }
        else {
                message("The SAMSUNG data set not found in the working directory")
        }
        
        # 2. READING DATA FILES
        ##activity labels with ids
        act_labels <- read.table("./UCI HAR Dataset//activity_labels.txt", col.names = c("id", "name"))
        ##data headers
        features <- read.table("./UCI HAR Dataset//features.txt", col.names = c("id", "feature"))
        ##the 'features' table will serve as column names, so it has to be trimmed to a proper format
        features$feature <- gsub("-mean\\(\\)", "_MEAN", features$feature)
        features$feature <- gsub("-std\\(\\)", "_STD", features$feature)
        features$feature <- gsub("-", "_", features$feature)
        features$feature <- gsub("\\(\\)", "", features$feature)
        ##test data
        test_data <- read.table("./UCI HAR Dataset//test//X_test.txt", col.names = features[,"feature"])
        ##training data
        train_data <- read.table("./UCI HAR Dataset//train//X_train.txt", col.names = features[,"feature"])
        ##test activity labels
        test_labels <- read.table("./UCI HAR Dataset//test//y_test.txt", col.names = c("id"))
        ###replace numbers with labels in the test set
        test_labels <- merge(test_labels, act_labels, by = "id")[,"name"]
        ###add activity labels to test data set
        test_data$activity <- test_labels
        ##trainig activity labels
        train_labels <- read.table("./UCI HAR Dataset//train/y_train.txt", col.names = c("id"))
        ###replace numbers with labels in the training set
        train_labels <- merge(train_labels, act_labels, by = "id")[,"name"]
        ###add activity labels to training data set
        train_data$activity <- train_labels
        
        ##subjects
        test_subjects <- read.table("./UCI HAR Dataset//test//subject_test.txt", col.names = c("subject"))
        train_subjects <- read.table("./UCI HAR Dataset//train/subject_train.txt", col.names = c("subject"))
        
        ##add subject info to training data set
        train_data$subject <- train_subjects[,"subject"]
        ##add subject info to test data set
        test_data$subject <- test_subjects[,"subject"]
        
        # 3. MERGING THE TRAINING AND TEST SETS
        ##join two data frames
        whole_data <- rbind(train_data, test_data)
        ##pick only columns containing means and standard deviations (also 'subject' and 'activity')
        whole_data <- whole_data[ , grepl("subject|activity|_MEAN|_STD", x = colnames(whole_data), ignore.case = F)]
        
        #CREATING THE AVERAGED TIDY DATA SET
        ##aggregating by subject and activity
        aggregated_data <- aggregate(. ~ subject + activity, data = whole_data, FUN = mean)
        ##sorting the rows
        aggregated_data <- aggregated_data[order(aggregated_data$subject, aggregated_data$activity),]
        ##writing the file with results
        write.table(aggregated_data, "averaged_data.txt", row.names = F)
}
