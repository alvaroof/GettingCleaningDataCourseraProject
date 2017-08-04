# GettingCleaningDataCourseraProject
### Repo for the final project in the coursera's course: Getting and Cleaning Data

In order to load  into your R workspace the tidy data provided as tidydata.txt, please use:
```sh
read.table(file, row.names = FALSE)
```
If you want to run the script by your own, please note that you would need to edit the path in the setwd() function at the beginning and in the write.table() at the end to fit your own.
The script run_analysis.R downloads, processes and cleans the dataset for the Samsung wearable , which is available under: 
* [Wearable raw dataset]

The raw data consists in several separated files. you can get more information directly from the originla source in the following files:

-   features_info.txt
-   README.txt

The output consists in two files, 
**stdmean**: table that has only the variables related to mean and std for all subjects and activities
**tidydata**: a tidy dataset containing the average of all the variables in table stdmean aggregated by subject and activity

To read about the variables contained in the output files please head to codebook.md


#### Thanks for reading, good luck in the courses to come!

[//]: # 
[Wearable raw dataset]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip