### Introduction

This document explains the process from the raw data to the tidy data corresponding to this course project. It also contain the Code Book of the outcome file, as well as the R Code used to create part of the Code Book.

In order to run the code the only requirement is to place the “UCI HAR Dataset” folder within the current wd. Please, consider the “paths” may differ between Windows and OS platform. This work was done within a OS X Yosemite 10.10.2 environment.

As the input information is detailed I have tried to minimized typing as much as I could; meaning I instructed R to read for me the file names, the variable names, etc, which I later re-introduce as arguments for handling the data as explained below.

### The script explanation step by step (numbering corresponds to script)

1 Setting the initial wd where “UCI HAR Dataset” folder is placed
2 Pointing R to the appropriate folder (train)
3 Reading the file names as long as they have “_train” as part of the name
4 Reading the files as a list to get a list of data frames. This is because we have 3 different files for the train and test groups which are treated as one list each.
5-6-7 analogous to 2-3-4 for the test group
8 Creating the names for the later combined data frame: taking out “train” suffix
9 Combined transformation in a loop of length 3: first(inner) it creates the combined file by rbinding the corresponding data frames (X,y,Subject) from train and test groups. Then, it assigns the name from step 8.
10 Just cleaning the workspace
11 Pointing R to the appropriate folder to get information from “features.txt” and “activity_labels.txt”
12 Extracting features names as character/not a factor
13 Extracting activities labels and levels
14 Naming the combined X file variables with the features names
15 Just cleaning
16 Extracting only the measurements on the mean and standard deviation for each measurement as per project instructions.
17 Step 16 filter brings some “noise” (variables with name -meanFreq()) that are filtered off here
18 Subsetting the featured data frame to keep only those variables as per project instructions
19 Cleaning
20 Naming “subjects” and “activities”
21 Combining selected features with subjects and activities
22 Cleaning, what else?
23 Formatting activities with proper levels and labels previously extracted
24 Cleaning
25 Pointing R to the wd where tidy data is going to be written.
26 Calling dplyr package for handling data in a easier way
27 Chained data manipulation to get the tidy.data.set:a) declaring c.data as tbl_df class object to apply dplyr verbs for easier manipulation; b) grouping by activity and subject; c) applying the mean as a summary function to each of the non grouping variables.
28 Writing the file “tidy_data.set.txt”
29 Detaching plyr……and cleaning

### Code Book

The transformation described above were applied on the original X features files which contain several measures from the time and frequencies’ domains (properly identify with the firs variable name letter and, also, in the variable labels) associated with body linear acceleration, gravity, and gyroscope velocity n a normalized scale [-1,1].Being this data the outcome of averaging, the features variables scale is also normalized in the interval [-1,1]. 
There are also the activity and subject variables to identify which subject was conducting which activity by the time the measures were made.

Please, see the original Code Book for more information.



##Variables


variable.number 	variable.names	

variable.label



1	activity	

activity conducted

	variable levels

		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING

2	subject	

observed subject id

3	tBodyAcc-mean()-X
	
average for each activity and each subject of time domine body linear acceleration -mean()-X

4	tBodyAcc-mean()-Y
	
average for each activity and each subject of time domine body linear acceleration -mean()-Y

5	tBodyAcc-mean()-Z
	
average for each activity and each subject of time domine body linear acceleration -mean()-Z

6	tBodyAcc-std()-X
	
average for each activity and each subject of time domine body linear acceleration -std()-X

7	tBodyAcc-std()-Y
	
average for each activity and each subject of time domine body linear acceleration -std()-Y

8	tBodyAcc-std()-Z
	
average for each activity and each subject of time domine body linear acceleration -std()-Z

9	tGravityAcc-mean()-X	

average for each activity and each subject of time domine body linear acceleration -mean()-X

10	tGravityAcc-mean()-Y	

average for each activity and each subject of time domine body linear acceleration -mean()-Y

11	tGravityAcc-mean()-Z	

average for each activity and each subject of time domine body linear acceleration -mean()-Z

12	tGravityAcc-std()-X	

average for each activity and each subject of time domine body linear acceleration -std()-X

13	tGravityAcc-std()-Y	

average for each activity and each subject of time domine body linear acceleration -std()-Y

14	tGravityAcc-std()-Z	

average for each activity and each subject of time domine body linear acceleration -std()-Z

15	tBodyAccJerk-mean()-X	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -mean()-X

16	tBodyAccJerk-mean()-Y	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -mean()-Y

17	tBodyAccJerk-mean()-Z	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -mean()-Z

18	tBodyAccJerk-std()-X	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -std()-X

19	tBodyAccJerk-std()-Y	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -std()-Y

20	tBodyAccJerk-std()-Z	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal -std()-Z

21	tBodyGyro-mean()-X	

average for each activity and each subject of time domine body gyroscope -mean()-X

22	tBodyGyro-mean()-Y	

average for each activity and each subject of time domine body gyroscope -mean()-Y

23	tBodyGyro-mean()-Z	

average for each activity and each subject of time domine body gyroscope -mean()-Z

24	tBodyGyro-std()-X	

average for each activity and each subject of time domine body gyroscope -std()-X

25	tBodyGyro-std()-Y	

average for each activity and each subject of time domine body gyroscope -std()-Y

26	tBodyGyro-std()-Z	

average for each activity and each subject of time domine body gyroscope -std()-Z

27	tBodyGyroJerk-mean()-X	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -mean()-X

28	tBodyGyroJerk-mean()-Y	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -mean()-Y

29	tBodyGyroJerk-mean()-Z	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -mean()-Z

30	tBodyGyroJerk-std()-X	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -std()-X

31	tBodyGyroJerk-std()-Y	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -std()-Y

32	tBodyGyroJerk-std()-Z	

average for each activity and each subject of time domine body gyroscope derived Jerk signal -std()-Z

33	tBodyAccMag-mean()	

average for each activity and each subject of time domine body linear acceleration magnitude -mean()

34	tBodyAccMag-std()	

average for each activity and each subject of time domine body linear acceleration magnitude -std()

35	tGravityAccMag-mean()	

average for each activity and each subject of time domine body linear acceleration magnitude -mean()

36	tGravityAccMag-std()	

average for each activity and each subject of time domine body linear acceleration magnitude -std()

37	tBodyAccJerkMag-mean()	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal magnitude -mean()

38	tBodyAccJerkMag-std()	

average for each activity and each subject of time domine body linear acceleration derived Jerk signal magnitude -std()

39	tBodyGyroMag-mean()	

average for each activity and each subject of time domine body gyroscope magnitude -mean()

40	tBodyGyroMag-std()	

average for each activity and each subject of time domine body gyroscope magnitude -std()

41	tBodyGyroJerkMag-mean()	

average for each activity and each subject of time domine body gyroscope derived Jerk signal magnitude -mean()

42	tBodyGyroJerkMag-std()	

average for each activity and each subject of time domine body gyroscope derived Jerk signal magnitude -std()

43	fBodyAcc-mean()-X	

average for each activity and each subject of frequency domine body linear acceleration -mean()-X

44	fBodyAcc-mean()-Y	

average for each activity and each subject of frequency domine body linear acceleration -mean()-Y

45	fBodyAcc-mean()-Z	

average for each activity and each subject of frequency domine body linear acceleration -mean()-Z

46	fBodyAcc-std()-X	

average for each activity and each subject of frequency domine body linear acceleration -std()-X

47	fBodyAcc-std()-Y	

average for each activity and each subject of frequency domine body linear acceleration -std()-Y

48	fBodyAcc-std()-Z	


average for each activity and each subject of frequency domine body linear acceleration -std()-Z

49	fBodyAccJerk-mean()-X	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -mean()-X

50	fBodyAccJerk-mean()-Y	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -mean()-Y

51	fBodyAccJerk-mean()-Z	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -mean()-Z

52	fBodyAccJerk-std()-X	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -std()-X

53	fBodyAccJerk-std()-Y	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -std()-Y

54	fBodyAccJerk-std()-Z	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal -std()-Z

55	fBodyGyro-mean()-X	

average for each activity and each subject of frequency domine body gyroscope -mean()-X

56	fBodyGyro-mean()-Y	

average for each activity and each subject of frequency domine body gyroscope -mean()-Y

57	fBodyGyro-mean()-Z	

average for each activity and each subject of frequency domine body gyroscope -mean()-Z

58	fBodyGyro-std()-X	

average for each activity and each subject of frequency domine body gyroscope -std()-X

59	fBodyGyro-std()-Y	

average for each activity and each subject of frequency domine body gyroscope -std()-Y

60	fBodyGyro-std()-Z	

average for each activity and each subject of frequency domine body gyroscope -std()-Z

61	fBodyAccMag-mean()	

average for each activity and each subject of frequency domine body linear acceleration magnitude -mean()

62	fBodyAccMag-std()	

average for each activity and each subject of frequency domine body linear acceleration magnitude -std()

63	fBodyBodyAccJerkMag-mean()	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal magnitude -mean()

64	fBodyBodyAccJerkMag-std()	

average for each activity and each subject of frequency domine body linear acceleration derived Jerk signal magnitude -std()

65	fBodyBodyGyroMag-mean()	

average for each activity and each subject of frequency domine body gyroscope magnitude -mean()

66	fBodyBodyGyroMag-std()	

average for each activity and each subject of frequency domine body gyroscope magnitude -std()

67	fBodyBodyGyroJerkMag-mean()	

average for each activity and each subject of frequency domine body gyroscope derived Jerk signal magnitude -mean()

68	fBodyBodyGyroJerkMag-std()	

average for each activity and each subject of frequency domine body gyroscope derived Jerk signal magnitude -std()




### Code for extracting information for the Code Book

It assumes we have the tidy.data.set loaded into R (this is, the outcome of the original script). 

<!-- -->

variable.names.df<-as.data.frame(names(tidy.data.set), stringsAsFactors=F)

names(variable.names.df)<-"variable.names"
    
variable.labels.df<-within(variable.names.df,{
                time.domine=ifelse(substr(variable.names,1,1)=="t","time domine","")
                frequency.domine=ifelse(substr(variable.names,1,1)=="f","frequency domine","")
                bodyacc=ifelse(grepl("BodyAcc",variable.names), "body linear acceleration","")
                gravacc=ifelse(grepl("GravityAcc",variable.names), "body linear acceleration","")
                bodygyro=ifelse(grepl("BodyGyro",variable.names), "body gyroscope","")
                mag=ifelse(grepl("Mag",variable.names), "magnitude","")
                jerk=ifelse(grepl("Jerk",variable.names), "derived Jerk signal","")
                append=substr(variable.names, 
                              regexpr("-",variable.names),nchar(variable.names))
                variable.label.0=paste("average for each activity and each subject of ",time.domine,
                             frequency.domine, bodyacc, gravacc,bodygyro,jerk,mag,append,collapse=NULL)
                variable.label=gsub("  |   |    |     |      |       "," ",variable.label.0)
                
                                            }
                         )
variable.labels.df$variable.label[1]<-"activity conducted"
variable.labels.df$variable.label[2]<-“observed subject id "


variable.labels.file<-variable.labels.df[c("variable.names","variable.label")]   

write.table(variable.labels.file, file="variable.labels.txt", quote=F,sep="\t", row.names=T, col.names=T)


