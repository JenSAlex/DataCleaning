library(plyr)
library(dplyr)
library(reshape2)


#  Set the list of columns we care about in the data
nmMatch<-c("-std()","-mean()")

#  Read in the label and attribute values
colLabels<-read.table("UCI HAR Dataset/features.txt")
actLabels<-read.table("UCI HAR Dataset/activity_labels.txt")

#  Get the activity lists and subject data
testLabels<-read.table("UCI HAR Dataset/test/y_test.txt")
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt")

trainLabels<-read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt")

#  Apply names to activities and combine with subject and set name
testAct<-join(testLabels,actLabels,"V1")
names(testAct)[1]<-"activity.id"
names(testAct)[2]<-"activity"
testAct$subject<-testSubject$V1
testAct$set<-"TEST"

trainAct<-join(trainLabels,actLabels,"V1")
names(trainAct)[1]<-"activity.id"
names(trainAct)[2]<-"activity"
trainAct$subject<-trainSubject$V1
trainAct$set<-"TRAIN"



#  Get the measures data
testData<-read.table("UCI HAR Dataset/test/x_test.txt")
trainData<-read.table("UCI HAR Dataset/train/x_train.txt")

#  Apply column names to data
names(testData)<-colLabels$V2
names(trainData)<-colLabels$V2

#  Filter out only the columns we care about
testData2<-testData[,grepl(paste(nmMatch,collapse="|"),names(testData))]
trainData2<-trainData[,grepl(paste(nmMatch,collapse="|"),names(trainData))]

#  Get the list of columns left in the dataset
measureCols<-colnames(testData2)
idCols<-colnames(testAct)

# Combine the datasets

testFinalData<-cbind(testAct,testData2)
trainFinalData<-cbind(trainAct,trainData2)
finalData<-rbind(testFinalData,trainFinalData)

# Create Summary Data
dataMelt<-melt(finalData,id=idCols,measure.vars=measureCols)
# can be used to create info by activity:  actData<-dcast(dataMelt,activity~variable,mean)
# can be used to create info by subject:  subData<-dcast(dataMelt,subject~variable,mean)
combData<-dcast(dataMelt,activity+subject~variable,mean)


#  Output final data set
write.table(combData,"summaryDataOutput.txt",row.names = FALSE)
print(combData)


