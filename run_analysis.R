#set the path
path <- file.path(getwd(), "UCI HAR Dataset")

#read in all the files
Train         <- read.table(file.path(path, "train", "X_train.txt"))
Test          <- read.table(file.path(path, "test",  "X_test.txt"))
SubjectTrain  <- fread(file.path(path, "train", "subject_train.txt"))
SubjectTest   <- fread(file.path(path, "test" , "subject_test.txt" ))
ActivityTrain <- fread(file.path(path, "train", "Y_train.txt"))
ActivityTest  <- fread(file.path(path, "test" , "Y_test.txt" ))

#merge the train and test files
Subject <- rbind(SubjectTrain, SubjectTest)
setnames(Subject, "V1", "subject")
Activity <- rbind(ActivityTrain, ActivityTest)
setnames(Activity, "V1", "activity")
Data <- rbind(Train, Test)

#delete the old files
rm(list = c("Train", "Test", "SubjectTrain", "SubjectTest", "ActivityTrain", "ActivityTest"))

#name the variables of Data according to features.txt
setnames(Data, old = 1:561, new = fread(file.path(path, "features.txt"))$V2)

#keep only the variables which end in "mean()" or "std()"
Data <- Data[, grep("(mean\\(\\)|std\\(\\))$", names(Data))]

#add the subject as a variable to Data
Data <- cbind(Data, Subject, Activity)
rm(Subject)
rm(Activity)

#label the activities
Data$activity <- factor(Data$activity, levels = 1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#convert subject and activity to factors
Data$subject <- as.factor(Data$subject)
Data$activity <- as.factor(Data$activity)

#summarize the data by taking the mean for each combination of subject and activity
library(data.table)
TidyData <- data.table(Data)
TidyData <- TidyData[, lapply(.SD, mean), by=.(subject, activity)]
rm(Data)
rm(path)