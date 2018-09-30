# getting the required docs
if(!file.exists("./project")){dir.create("./project")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./project/pro.zip")

#unzipping the file
unzip("./project/pro.zip",exdir = "./project")

#Define The path
path <- file.path("./project", "UCI HAR Dataset")
list.files(path,recursive = TRUE)

#Read The tables
y_Test <- read.table(file.path(path,"test","y_test.txt"),header = FALSE)
y_Train <- read.table(file.path(path,"train","y_train.txt"),header = FALSE)
Subject_Train <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
Subject_Test  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
X_Test  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
X_Train <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

#combine the data and change the names
Y <- rbind(y_Test,y_Train)
Subject <- rbind(Subject_Test,Subject_Train)
X <- rbind(X_Test,X_Train)
names(Y) <- c("Activity")
names(Subject) <- c("Subject")
FeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(X)<- FeaturesNames$V2
combine <- cbind(Y,Subject,X)

#Subset the data
sub_feature_names <- grep("mean\\(\\)|std\\(\\)",FeaturesNames$V2, value = TRUE)
New_names <- c(as.character(sub_feature_names),"Activity","Subject")
sub_data <- subset(combine,select = New_names)

#Provide Proper activity names
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
for(i in 1:6)
{
  sub_data$Activity <- sub(activityLabels$V1[i],activityLabels$V2[i],sub_data$Activity)
}
names(sub_data)<-gsub("^t", "time", names(sub_data))
names(sub_data)<-gsub("^f", "frequency", names(sub_data))
names(sub_data)<-gsub("Acc", "Accelerometer", names(sub_data))
names(sub_data)<-gsub("Gyro", "Gyroscope", names(sub_data))
names(sub_data)<-gsub("Mag", "Magnitude", names(sub_data))
names(sub_data)<-gsub("BodyBody", "Body", names(sub_data))


#Make the final data set
library(plyr);
Final_data<-aggregate(. ~Subject + Activity, sub_data, mean)
Final_data<-Final_data[order(Final_data$Subject,Final_data$Activity),]
write.table(Final_data, file = "tidydata.txt",row.name=FALSE)

#Make the code book
library(dataMaid)
makeCodebook(Final_data)
