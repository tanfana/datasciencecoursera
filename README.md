==================================================================
Human Activity Recognition Using Smartphones Dataset
(Version 1.0)

==================================================================

* Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
* Smartlab - Non Linear Complex Systems Laboratory
* DITEN - Università degli Studi di Genova.
* Via Opera Pia 11A, I-16145, Genoa, Italy.
* activityrecognition@smartlab.ws
* www.smartlab.ws

===============================================================

The README.md describes the transformations performed to convert 
the raw data into the tidy data.

=================================================================

I used R script called `run_analysis.R` to convert raw data into the tidy data. 

Raw data: Human Activity Recognition Using Smartphones 

Tidy Data long form: `summerize_data_long`

================================================================
I used the following files:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

================================================================

#### Prepare things before merging: Create working directory and download the raw data from web
* checking for and creating directory ("dataCourseProject") for my files (data, R script, etc.)
* set this directory ("dataCourseProject") as my working directory
* get [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) `Dataset.zip` from web
* unzip the folder to `UCI HAR Dataset`
* read the following files (features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt) in the folder `UCI HAR Dataset` and check out the dimension

#### 1. Merge the training and the test sets to create one data set
* installing/loading the packages (plyr, dplyr, tidyr)
* merge first TEST data sets:
	* use for X_test.txt the original column names from features.txt as variable names
	* convert invalid characters in the original column names like '-' to '.'
	* name column of y_test.txt with `activity`
	* name column of subject_test.txt with `subjectID`
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
* convert integer variable `activity` to factor variable in `extractDF` data frame
* rename levels of factor variable `activity` with descriptive activity names from file activity_labels.txt


#### 4. Appropriately labels the data set with descriptive variable names
* modify the feature labels to descriptive variable names in some steps
* `t` to `time` etc. (for more information see codebook.md)

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* group data frame `extracDF` by the `subjectID` and `activity` variable
* return the mean of each variable for each `subjectID` and each `activity` with `summarise_each()` function
* create a tidy data in long form with variable names: subjectID, activity, measure, mean
* result: `summerize_data_long` data frame
* write data frame in a text file with `write.table()` function

