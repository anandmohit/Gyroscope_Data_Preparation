library(dplyr)

setwd("F:\\iStudy\\Data World\\Coursera_Gtng_Clng\\UCI HAR Dataset")

## Import and Merge the training and test data

activityLabel = read.table('./activity_labels.txt')
features     = read.table('./features.txt')
subjectTrain = read.table('./train/subject_train.txt')
xTrain       = read.table('./train/x_train.txt')
yTrain       = read.table('./train/y_train.txt')

subjectTest <- read.table('./test/subject_test.txt')
xTest <- read.table('./test/x_test.txt')
yTest <- read.table('./test/y_test.txt')

colnames(activityLabel)  = c('activityId','activityType')
colnames(subjectTrain)  = "subjectId"
colnames(xTrain)        = features[,2] 
colnames(yTrain)        = "activityId"

colnames(subjectTest)<- "subjectId"
colnames(xTest)       = features[,2] 
colnames(yTest)       = "activityId"


train_data <- cbind(yTrain,subjectTrain,xTrain)
test_data <- cbind(yTest,subjectTest,xTest)

merge_data <- rbind(train_data,test_data)

## Step 2

coltoKeep <- grepl("activity..|subject..|-mean..|-meanFreq..|mean..-|-std..|-std()..-",colnames(merge_data))
table(coltoKeep)

merge_data <- merge_data[,coltoKeep]

## Step 3

merge_data <-merge(merge_data,activityLabel, by = 'activityId', all.x = TRUE)

final_cols <- colnames (merge_data)

## Step 4

for (i in 1:length(final_cols)) 
{
  final_cols[i] = gsub("-std$","StdDev",final_cols[i])
  final_cols[i] = gsub("-mean","Mean",final_cols[i])
  final_cols[i] = gsub("\\()","",final_cols[i])
  final_cols[i] = gsub("^(t)","time",final_cols[i])
  final_cols[i] = gsub("^(f)","freq",final_cols[i])
  final_cols[i] = gsub("([Gg]ravity)","Gravity",final_cols[i])
  final_cols[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",final_cols[i])
  final_cols[i] = gsub("[Gg]yro","Gyro",final_cols[i])
  final_cols[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",final_cols[i])
  final_cols[i] = gsub("AccMag","AccMagnitude",final_cols[i])
  final_cols[i] = gsub("JerkMag","JerkMagnitude",final_cols[i])
  final_cols[i] = gsub("GyroMag","GyroMagnitude",final_cols[i])
}

colnames(merge_data)<- final_cols

## Step 5

second_dataset <- merge_data %>% 
  group_by(subjectId, activityId) %>%
  summarise_all(mean)

# output to file "tidy_data.txt"
write.table(second_dataset, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
