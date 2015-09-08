#CodeBook

##Variables

###Features

As it was specified in the course project instructions:
>"Extracts only the measurements on the mean and standard deviation for each measurement" 
and understanding the written in ``features_info.txt`` file: 

``mean()``: Mean value
``std()``: Standard deviation

Every feature that contains in any of ``mean()`` or ``std()`` belongs to the subset requiered in the project, then from 561 features were selected 66 features.

1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()

###Activities

The data that is provided in this project as raw data has been labeled with numbers instead of descriptive labels, so using the values specified in the ``activity_labels.txt`` file, the tidy data will have both. ``id_activity`` is the numeric value and ``activity`` is the descriptive value.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

###Subject variable

``id_subject``: This variable that belongs to the tidy dataset is the subject that perform the differents activities shown above.

##Processing the raw data

``getFeaturesNames()``: This method get the names of the features file and return it as a vector.

``createTestDataSet()``: This method create a dataset with test data, using a ``cbind`` to get the subject, activities and features together and using ``getFeaturesNames`` method to set columns names, return the test dataset as a data frame.

``createTrainDataSet()``: This method create a dataset with train data, using a ``cbind`` to get the subject, activities and features together and using ``getFeaturesNames`` method to set columns names, return the train dataset as a data frame.

``createMergedDataSet()``: This method merge the train and test data using ``createTrainDataSet`` and ``createTestDataSet`` methods to get each dataset and a ``rbind`` to merge them, return the merged dataset as a data frame.

``selectMeanAndStdFeaturesInMergedDataSet()``: This method takes the mergeData result and select only the features that match with ``std()`` or ``mean()``, return the selected data as data frame. Note: For some reason in Windows 7 the () are replaced by ..

``labelActivities()``: This method adds a new column with the descriptive values for activities instead of the numeric ones, return the correctly labeled dataset as a data frame.

``getTidyDataSet()``: This method makes use of ``melt`` and ``dcast`` to get the mean of each variable for subject and activity, it returns the tidy dataset as data frame.

**``run_analysis()``**: This method takes the result of tidyData method and write it in a file to finish this project, this method does not return anything and is executed by default when ``run_analisys.R`` is loaded.

##Special requirements

This project uses reshape2 library and is neccessary to download it and attach it in the library folder of R Studio.