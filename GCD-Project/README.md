#Introduction

This project is based on a experiment[1] where 30 volunteers were participant of some activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while they were carrying a Samsung Galaxy S II in their weist, the smartphone collected some data from some sensors(accelerometer and gyroscope), and this data after being cleaned and normalized by the authors of the project is used by me as raw data to get a tidy dataset that will satisfy the project in the Getting and Cleaning Data Course from John Hopkins University and Coursera. 

##Running the script

* Clone the project with github
* Download ´´reshape2´´ library and add it to R Studio library folder
* Set the project as working directory with the ´´setwd()´´ command
* Load the ´´run_analysis.R´´ file using the following command: ´´source("run_analysis.R")´´
* Look for ´´tidyData.txt´´ file in the project folder
* To verify the data you can use the ´´read.table("tidyData.txt")´´ command

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012