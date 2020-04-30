# SETTING THE WORKING DIRECTORY AS "./getdata"
cur_dir<-"./getdata"
if(!dir.exists("./getdata"))
dir.create("./getdata")
setwd(cur_dir)
getwd()

# Libraries used in this R-program

library(data.table)
library(dplyr)

#DOWNLOAD THE DATASET AND UNZIP THE FILE

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile<-"UCI HAR Dataset.zip"

download.file(fileUrl, zipfile)

if(file.exists(zipfile))
unzip(zipfile)


# READ TWO SUPPORTING DATA FILES

# 1. "featureNames"( tells about the name of the features)
# 2. "activityLabels"( tells about the name of the activities)

featureNames<-read.table("UCI HAR Dataset/features.txt")
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")

# READ TRAINING DATA

subjectTrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
activityTrain<-read.table("UCI HAR Dataset/train/y_train.txt")
featuresTrain<-read.table("UCI HAR Dataset/train/X_train.txt")

#READ TEST DATA

subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt")
activityTest<-read.table("UCI HAR Dataset/test/y_test.txt")
featuresTest<-read.table("UCI HAR Dataset/test/X_test.txt")

# Q1.MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.
 

# MERGE THE TRAINING DATA AND TEST DATA BY ROWS

subject<-rbind(subjectTrain, subjectTest)
activity<-rbind(activityTrain, activityTest)
features<-rbind(featuresTrain, featuresTest)

# NAMING THE COLUMNS

colnames(subject)<-"Subject"
colnames(activity)<-"Activity"
colnames(features)<-t(featureNames[2])

# MERGE THE DATASETS BY COLUMNS AND STORE THE DATA IN 'mergedData'

mergedData<-cbind(features, subject, activity)
 

# Q2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION
#     FOR EACH MEASUREMENT

# EXTRACTS THE COLUMNS THAT HAVE MEAN AND STD

MeanSTD<-grep(".*Mean.*|.*STD.*", names(mergedData), ignore.case=TRUE)

# ADDING THE SUBECT AND ACTIVITY COLUMNS

requiredColumns<-c(MeanSTD, 562, 563)
dim(mergedData)

#SELECTED THE REQUISITE COLUMNS WITH MEAN AND STD AND STORED IN "requiredData"


requiredData<-mergedData[, requiredColumns]
dim(requiredData)



# Q3. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET

# CHANGING THE NUMERIC TYPE DATA IN 'Activity' VARIABLE TO CHARACTER TYPE DATA
# TO ACCEPT NAMES FROM THE FILE 'activityLabels'.

rd<-requiredData$Activity

rd<-as.character(rd)

for(i in 1:6)
{
rd[rd==i]<-as.character(activityLabels[i,2])
}

rd<-as.factor(rd)

# Q4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

# BY USING THE FILE "features_info" , CHANGED THE ABBREVATIONS 
#  INTO DESCRIPTIVE VARIABLES NAMES
 

names(requiredData)<-gsub("^t", "Time", names(requiredData))

names(requiredData)<-gsub("Acc", "Accelerometer", names(requiredData))

names(requiredData)<-gsub("-std()", "STD", names(requiredData), ignore.case = TRUE)

names(requiredData)<-gsub("gravity", "Gravity", names(requiredData)) 


names(requiredData)<-gsub("-mean()", "Mean", names(requiredData), ignore.case = TRUE)

names(requiredData)<-gsub("^f", "Frequency", names(requiredData))

names(requiredData)<-gsub("Gyro", "Gyroscope", names(requiredData))

names(requiredData)<-gsub("BodyBody", "Body", names(requiredData))

names(requiredData)<-gsub("Mag", "Magnitude", names(requiredData))

names(requiredData)<-gsub("tBody", "TimeBody", names(requiredData))

names(requiredData)<-gsub("-freq()", "Frequency", names(requiredData), ignore.case = TRUE)

names(requiredData)<-gsub("angle", "Angle", names(requiredData))

# Q5. FROM THE DATA SET IN STEP4, CREATES A SECOND, INDEPENDENT TIDY DATA SET
# WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

# CONVERTING THE SUBJECT AS A FACTOR VARIABLE

requiredData$Subject<-as.factor(requiredData$Subject)
requiredData<-data.table(requiredData)

# CREATING THE DATA SET WITH AVERAGE FOR EACH ACTIVITY AND SUBJECT 

tidyData<-aggregate(.~Subject + Activity, requiredData, mean)

# ORDER THE STRUCTURE AND WRITE IT INTO DATA FILE "Tidy.txt" , THAT CONTAINS
# NEW TIDY DATA.

tidyData<-tidyData[order(tidyData$Subject, tidyData$Activity),]
write.table(tidyData, file="Tidy.txt", row.names=FALSE)
