---
title: "CodeBook.md"
output: html_document
---

##Variables:
idCols:  columns that create the ID portion of the data
measureCols:  columns that create the measure portion of the data
nmMatch:  filters for matching the data from the larger data set

actLabels:     Labels for the activity data
colLabels:     Labels for the measured data
combData:      final summarized data set
dataMelt:      data that has been shaped into a long data set
finalData:     combination of complete test and train data
testAct:       Activities for the Test dataset
testData:      All measures for the Test dataset
testData2:     Filtered measures for the Test dataset
testFinalData: complete filtered dataset for Test data
testLabels:    Activity labels for the Test data
testSubject:   Subject data for the Test dataset
trainAct:       Activities for the train dataset
trainData:      All measures for the train dataset
trainData2:     Filtered measures for the train dataset
trainFinalData: complete filtered dataset for train data
trainLabels:    Activity labels for the train data
trainSubject:   Subject data for the train dataset    


##Data:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The final result is the average of each of the mean and std values that were measured, grouped by activity and subject.

##Transformations:
1) Joined the activity labels to the activity data set to create text labels
2) Used pattern matching to pull the std() and mean() values from the larger data set
3) Used binding to merge the test and training data
4) Used datamelt to create a long data set of all of the data
5) Used cast to summarize the data by Activity and Subject and create a clean wide dataset