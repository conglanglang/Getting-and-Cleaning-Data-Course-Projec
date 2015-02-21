##This code book describes the variables, the data, and any transformations or work about the ' run_analysis.R'.
-----------------------------------------------------------------------------------------------------------------

-lables:read the file named 'activity_labels.txt', get the 'Links the class labels with their activity name'

-subject_test:read the file named 'subject_test.txt', get the 'the subject who performed the activity'

-X_test:read the file named 'X_test.txt', get the 'test set'

-y_test:read the file named 'y_test.txt', get the 'test labels'

-lab_test:join the y_test with the lables

-ext_test:extracts only the measurements on the mean and standard deviation for each measurement

the following code/variables do the same things of 'train set'as above
-X_train
-y_train
-subject_train
-lab_train
-ext_train

-merge_data:merges the training and the test sets to create one data set

-avg_data:creates a second, independent tidy data set with the average of each variable for each activity and each subject

-write.table():create a txt file with write.table(), output the tidy data

the following code use to test the 'avg_data'
-list_act=split(avg_data,avg_data$act_name)
-write.table(list_act,"upload_list_act.txt",row.name=FALSE)
-list_sub=split(avg_data,avg_data$subject)
-write.table(list_sub,"upload_list_sub.txt",row.name=FALSE)
