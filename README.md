# Course_Project_Getting_and_Cleaning_Data
Coursera Course Getting_and_Cleaning_Data Project
Get the data
1.Download the file and put the file in the data folder
2.Unzip the file
3.unzipped files are in the folderUCI HAR Dataset. Get the list of the files

See the README.txt file for the detailed information on the dataset. For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:
test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt

Read data from the targeted files
1. Get the big picture of the structure of the data frame that will be used in this project.
the picture below comes from the picture post on forum by Community TA  David Hood.
Reference link: https://class.coursera.org/getdata-008/forum/thread?thread_id=24

From the picture and the related files, we can see:

Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
Names of Varibles Features come from “features.txt”
levels of Varible Activity come from “activity_labels.txt”
So we will use Activity, Subject and Features as part of descriptive variable names for data in data frame.

2.Read data from the files into the variables

Read the Activity files
Merges the training and the test sets to create one data set
1.Concatenate the data tables by rows
2.set names to variables
3.Merge columns to get the data frame Data for all data

Extracts only the measurements on the mean and standard deviation for each measurement
Subset Name of Features by measurements on the mean and standard deviation
i.e taken Names of Features with “mean()” or “std()”

Subset the data frame Data by seleted names of Features

Check the structures of the data frame Data

Uses descriptive activity names to name the activities in the data set
1.Read descriptive activity names from “activity_labels.txt”

facorize Variale activity in the data frame Data using descriptive activity names

Appropriately labels the data set with descriptive variable names
In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names.

prefix t is replaced by time
Acc is replaced by Accelerometer
Gyro is replaced by Gyroscope
prefix f is replaced by frequency
Mag is replaced by Magnitude
BodyBody is replaced by Body

Creates a second,independent tidy data set and ouput it
In this part,a second, independent tidy data set will be created with the average of each variable for each activity and each subject based on the data set in step 4.

Prouduce Codebook
