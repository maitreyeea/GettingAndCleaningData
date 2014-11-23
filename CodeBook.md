CodeBook
====================
Purpose
--------------------------
The purpose of this coursera project is to obtain and transform a raw or dirty data set into clean or tidy data set. Data used for this project is experimental data obtained from 'Human Activty Recognition using Smartphone Dataset'experiment. it records data coolected from accelerometer and gyroscope of Samsung Galaxy S II.

Script reads following files - 
-----------------------------
   * 'activity_labels.txt': Links the class labels with their activity name.
   * 'features.txt' : omplete list of all features from accelerometer and gyroscope(e.g body and gravity accelerometer and gyrometer signals)
   *  Test subject datasets - 'subject_test.txt', 'X_test.txt' and 'y_test.txt' datasets
   * Train subject datasets - 'subject_train.txt', 'X_train.txt' and 'y_train.txt' datasets
   * Subject text file identifieds subjects who performed the activities and range from 1 to 30
   * y_test and y_train text files include activities performed by each subject recorded in labels
   * x_test and x_train text files include the 561 features for which the data was recorded

For other information regarding the `` run_analysis.R `` script please refer to [README](https://github.com/maitreyeea/GettingAndCleaningData/blob/master/README.md) here.

Descriptive variables (existing and new) for tidy_final data set
------------------------------------------------
| column            | description                                              | type    |
| ------------------| -------------------------------------------------------- | ------- |
| Activity_ID       | Activity Labels ranging from 1 to 6                      | integer |
| Activity_Labels   | Label of the activities performed (Walking,Laying, Sitting etc)  | factor  |
| Subjects  | Identifier of volunteers ranging from 1 to 30  | integer |
|Identifier | New variable created to distinguish between 'test' and 'train' data | character |

Measure variables created from Features.txt file for tidy_final data set
-----------------------------------------------------------------------
The measure variables for this project come form feature dataset. the variables include accelerometer and gyroscope 3-axial raw time domaun signals and variables created by applying Fast Fourier Transform on few varialbes. 

  * Transformations  
      1. Extract only the measurements on the mean and standard deviation for each measurement. 
      2. Give appropriate descriptive names to the variables
      3. Create tidy dataset with only average of each variable for each activity and each subject.
  * Final aggregated dataset 
      1. Rows : 180 
      2. Columns : 70
  * Measure variable list -
    
  |  Final Column List                       | 
  | ---------------------------- | 
| TimeBodyAccMean-X |
| TimeBodyAccMean-Y |
TimeBodyAccMean-Z |
TimeBodyAcc-std-X |
TimeBodyAcc-std-Y |
TimeBodyAcc-std-Z |
TimeGravityAccMean-X |
TimeGravityAccMean-Y |
TimeGravityAccMean-Z |
TimeGravityAcc-std-X |
TimeGravityAcc-std-Y |
TimeGravityAcc-std-Z |
TimeBodyAccJerkMean-X |
TimeBodyAccJerkMean-Y |
TimeBodyAccJerkMean-Z |
TimeBodyAccJerk-std-X |
TimeBodyAccJerk-std-Y |
TimeBodyAccJerk-std-Z |
TimeBodyGyroMean-X  |
TimeBodyGyroMean-Y |
TimeBodyGyroMean-Z |
TimeBodyGyro-std-X |
TimeBodyGyro-std-Y |
TimeBodyGyro-std-Z |
TimeBodyGyroJerkMean-X |
TimeBodyGyroJerkMean-Y |
TimeBodyGyroJerkMean-Z |
TimeBodyGyroJerk-std-X |
TimeBodyGyroJerk-std-Y |
TimeBodyGyroJerk-std-Z |
TimeBodyAccMagMean |
TimeBodyAccMagStdDev |
TimeGravityAccMagMean |
TimeGravityAccMagStdDev |
TimeBodyAccJerkMagMean |
TimeBodyAccJerkMagStdDev |
TimeBodyGyroMagMean |
TimeBodyGyroMagStdDev |
TimeBodyGyroJerkMagMean |
TimeBodyGyroJerkMagStdDev |
FFTBodyAccMean-X | 
FFTBodyAccMean-Y|
FFTBodyAccMean-Z |
FFTBodyAcc-std-X |
FFTBodyAcc-std-Y |
FFTBodyAcc-std-Z | 
FFTBodyAccJerkMean-X |
FFTBodyAccJerkMean-Y |
FFTBodyAccJerkMean-Z |
FFTBodyAccJerk-std-X |
FFTBodyAccJerk-std-Y |
FFTBodyAccJerk-std-Z |
FFTBodyGyroMean-X |
FFTBodyGyroMean-Y |
FFTBodyGyroMean-Z |
FFTBodyGyro-std-X |
FFTBodyGyro-std-Y |
FFTBodyGyro-std-Z |
FFTBodyAccMagMean |
FFTBodyAccMagStdDev |
FFTBodyBodyAccJerkMagMean |
FFTBodyBodyAccJerkMagStdDev |
FFTBodyBodyGyroMagMean |
FFTBodyBodyGyroMagStdDev |
FFTBodyBodyGyroJerkMagMean |
FFTBodyBodyGyroJerkMagStdDev |
