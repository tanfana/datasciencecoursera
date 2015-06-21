The README.md describes the transformations performed to convert the raw data into the tidy data.

I used R script called `run_analysis.R` to convert raw data into the tidy data. 
The raw data: Human Activity Recognition Using Smartphones Dataset

#### Prepare things before merging: Create working directory and download the raw data from web
* checking for and creating directory ("dataCourseProject") for my files (data, R script, etc.)
* set this directory ("dataCourseProject") as my working directory
* get [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) `Dataset.zip` from web
* unzip the folder to `UCI HAR Dataset`
* find out the dim of following files (features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt) in the folder `UCI HAR Dataset`

#### 1. Merge the training and the test sets to create one data set
* installing/loading the packages (plyr, dplyr, tidyr)
* merge first TEST data sets:
	* use for X_test.txt the original column names from features.txt as variable names
	* convert invalid characters in the original column names like '-' to '.'
	* name column of y_test.txt with 'activity'
	* name column of subject_test.txt with 'subjectID'
	* merge columnwise the three test sets (X_test, y_test, subject_test)
* merge now TRAIN data sets analogous to TEST data sets
* merge TEST-data and TRAIN-data:
	* add new variable 'status' in TEST-data and TRAIN-data (with entries test/train)
* result: `totalDF` data frame

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* choosing the columns involving mean or standard deviation, i.e. the entries that include mean() and std() at the end
* result: `extractDF` data frame

#### 3. Uses descriptive activity names to name the activities in the data set
* read file activity_labels.txt
* convert integer variable 'activity' to factor variable in `extractDF` data frame
* renaming levels of a factor with descriptive activity names


#### 4. Appropriately labels the data set with descriptive variable names.


#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


