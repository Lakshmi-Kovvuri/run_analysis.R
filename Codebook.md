GETTING AND CLEANING DATA - Coursera Project  Codebook

List of FILE NAMES, VARIABLE NAMES used in my  assignment

1. Data downloaded under the folder called "UCI HAR Dataset".

     ⦁ "fileUrl" : web address of UCI HAR Dataset
     
     ⦁ "zipfile" : UCI HAR Dataset.zip
     
2. Data structure:

    The dataset includes the following list of  FILE NAMES and VARIABLES:
    
     ⦁ "featureNames"
     
		            Source file : features.txt
			    
		            Dimensions  : 561 rows , 2 columns
			    
		            Description : features of  Accelerometer and Gyroscope,                            
			                  3-axial raw signals tAcc-XYZ, tGyro-XYZ
			    
     ⦁ "activitiesLabels"
		            
			    Source file : activity_labels.txt
                
			    Dimensions  : 6 rows, 2 columns
                
			    Description : List of activities performed to take measurements.
			    
      ⦁	"subjectTrain"
      
		            Source file : subject_train.txt
			    
                	    Dimensions  : 7352 rows, 1 column
			    
                            Description : contains 70% of the data was selected for training.
			    
      ⦁	"activityTrain"
      
                            Source file : y_train.txt
			    
                            Dimensions  : 7352 rows , 1 column
 	              
		            Description : contains train data of activities
			    
      ⦁	"featuresTrain"
      
                            Source file : X_train.txt
      
                            Dimensions  : 7352 rows, 561 columns
			    
		            Description : contains recorded features of train data
			    
      ⦁ "subjectTest"
      
                            Source file : subject_test.txt
		            
			    Dimensions  : 2947 rows, 1 column
                              
			    Description : contains 30% of the data was selected for testing
      
      ⦁ "activityTest"
          
      		           Source file : y_test.txt
        
	                   Dimensions  : 2947 rows, 1 column
              
	                   Description : contains test data of activities
      
      ⦁	"featuresTest"	
      
                           Source file: X_test.txt
                     
		           Dimensions : 2947 rows, 1 column
                
		           Description: contains recorded features of test data

3. Merges the train data and test data to create one data set.

      ⦁	"subject" 
      
                           Source     : rbind(subjectTrain, subjectTest)
                
		           Dimensions : 10299 rows, 1 column
                
		           Description: contains merged data of subjectTrain and subjectTest 
      
      ⦁ "activity"
      
                           Source     : rbind(activityTrain, activityTest)
                        
			   Dimensions : 10299 rows, 1 column
                
		           Description: contains merged data of activityTrain and activityTest.
     
     ⦁	"features"
     
                           Source     : rbind(featuresTrain, featuresTest)
                
		           Dimensions : 10299 rows, 561 columns
                
		           Description: contains merged data of featuresTrain and featuresTest
     
     ⦁	"mergedData"
     
                           Source     : cbind(features, subject, activity)
                
		           Dimensions : 10299 rows, 563 columns
                
		           Description: contains the merged data of all test and train data sets

4. Extracts only the measurements on the mean and standard deviation for each measurement

     ⦁ "MeanSTD"
     
                           Description: contains the data of Mean and Standard Deviation columns
      
      ⦁	"requiredColumns:
      
                           Description: contains MeanSTD columns and the added columns of 'Subject' and 'Activity' .
     
     ⦁	"requiredData"
     
                           Dimensions : 10299 rows , 88 columns
                
		           Description: contains the 'mergedData' along with the 'Subject' & 'Activity' columns and 
                                        'MeanSTD' (mean and standard deviation) for each measurement.

5. Uses descriptive activity names to name the activities in the data set.

                           Used the names from "activityLabels" to name the activities for the 'Activity' column.
   
6. Appropriately labels the data set with descriptive variable names.

     ⦁  't' is renamed as 'Time'.
      
     ⦁	'Acc' is  renamed as 'Accelerometer'
     
     ⦁  '-mean' is renamed as 'Mean'
     
     ⦁	'-std' is renamed as 'STD'
     
     ⦁	'Gyro' is renamed as 'Gyroscope'
     
     ⦁	'mag' is renamed as 'magnitude'
     
     ⦁	'f' is renamed as 'frequency'
     
     ⦁	'BodyBody' is renamed as 'Body'
     
     ⦁	'gravity' is renamed as 'Gravity'
     
     ⦁	'angle' is renamed as 'Angle'
     
     ⦁	'tBody' is renamed as 'TimedBody'
     
     ⦁	'-freq' is renamed as 'frequency'

7. From the data set in step 4, creates a second, independent tidy data set with the average of
   each variable for each activity and each subject.
   
      ⦁	"tidyData"
      
               Dimensions: 180 rows, 88 columns
      
               Descriptions: data set with average for each 'Activity' and 'Subject'
     
     ⦁	"Tidy.txt"
     
               Description: contains the required and organized tidy data file.
