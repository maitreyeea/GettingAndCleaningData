Coursera - Getting And Cleaning Data
======================
The data for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description regarding the data set can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and zip file for the actual data can be found 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

run_analysis.R Script
------------------------------------------------------
The script will tidy up test and traini data set using following approach. `` run_analysis.R `` script assumes that data is donwloaded and unzipped in the working directory. Paste the script in parent directory of unzipped data folder and to run the script set working directory to source file location and click on 'Source' button in RStudio.

1. Read all the necessary files required to perform the cleanup and analysis.
	
2. Rename columns in 'x' datasets for test and train by features(feature names) from features data set.

3. Create a test data frame by -
	*  column binding the subject, x and y test data sets
   * adding a new column name identifier with value as 'test' to identify test records

4. Create a train data frame by -
	*  column binding the subject, x and y train data sets
   * adding a new column name identifier with value as 'train' to identify test records

5. Merge test and train each data set with activity_labels data set to obtain descriptive activity name against activity lables from y_test and y_train columns in the data frame.

6. Rowbind both data frames to create one data set

7. subset the column names to extract only the measurements on the mean and standard deviation for each measurement. (search for any pattern in features that has 'std' or 'mean' in the name ignoring the case using ``grep`` function)

8. Use ``gsub`` function to remove the brackets and to appropriately label the variable names

9. Performs aggregation with `` aggregate `` function as 'mean' on the tidy_final data set excluding the descriptive variables.

10. Export the aggregated data set using `` write.table `` function.
