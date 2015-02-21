library(plyr)

#read the file named 'activity_labels.txt', get the 'Links the class labels with their activity name'
lables<-read.table("./UCI HAR Dataset/activity_labels.txt")

#read the file named 'subject_test.txt', get the 'the subject who performed the activity'
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
#read the file named 'X_test.txt', get the 'test set'
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
#read the file named 'y_test.txt', get the 'test labels'
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",sep="")
#join the y_test with the lables
lab_test<-join(y_test,lables)
#extracts only the measurements on the mean and standard deviation for each measurement
ext_test<-data.frame(mean=apply(X_test,1,mean),
                     sd=apply(X_test,1,sd),
                     subject=subject_test[,1],
                     label=lab_test[,1],
                     act_name=lab_test[,2])

#the following code do the same things of 'train set'as above
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",sep="")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
lab_train<-join(y_train,lables)
ext_train<-data.frame(mean=apply(X_train,1,mean),
                     sd=apply(X_train,1,sd),
                     subject=subject_train[,1],
                     label=lab_train[,1],
                     act_name=lab_train[,2])

#merges the training and the test sets to create one data set
merge_data<-merge(ext_test, ext_train, all = TRUE)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
avg_data<-ddply(merge_data,.(subject,act_name),summarize,avg_mean=mean(mean))

#create a txt file with write.table(), output the tidy data
write.table(avg_data,"upload_avg_data.txt",row.name=FALSE)

#the following code use to test the 'avg_data'
#list_act=split(avg_data,avg_data$act_name)
#write.table(list_act,"upload_list_act.txt",row.name=FALSE)
#list_sub=split(avg_data,avg_data$subject)
#write.table(list_sub,"upload_list_sub.txt",row.name=FALSE)