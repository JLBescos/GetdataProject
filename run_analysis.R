## The scrip assumes you have "UCI HAR Dataset" FOLDER placed in the current wd

#1 Setting the initial wd where “UCI HAR Dataset” folder is placed

    initial.wd<-getwd()
    
#2 Pointing R to the appropriate folder (train)
    
    setwd(paste(initial.wd, "/UCI HAR Dataset/train", sep=""))  
    
#3 Getting the file names as long as they have “_train” as part of the name
    
    list.train.files<-grep("_train", list.files(), value=T)
    
#4 Reading/geting the train group files as a list to get a list of data frames. 
#  This is because we have 3 different files in each group (train and test) 
#  which are treated as one list each.
    
    train.data.frames<-lapply(list.train.files,function(x) {read.table(x, sep="")})
    
#5- 6 - 7 analogous to 2-3-4 for the test group
    
    setwd(paste(initial.wd, "/UCI HAR Dataset/test", sep=""))
#6
    list.test.files<-grep("_test", list.files(), value=T)
#7  
    test.data.frames<-lapply(list.test.files,function(x) {read.table(x, sep="")})
    

#8  Meta-data: Creating the names (for the later combined data frame) by taking out “train” suffix 
    
    names.for.combined.data.frames<-sub("_train.txt","",list.train.files)
    
#9 Combined transformation in a loop of length 3: first(inner) it creates the combined file 
#   by rbinding the corresponding data frames (X,y,Subject) from train and test groups. 
#   Then, it assigns the name from step 8.
    
for (i in seq_along(names.for.combined.data.frames)){
        assign(
            names.for.combined.data.frames[i],
            rbind.data.frame(train.data.frames[[i]], test.data.frames[[i]])
                 )}
    
#10 Just cleaning the workspace
    
    rm(i, list.test.files, list.train.files, names.for.combined.data.frames,
       test.data.frames, train.data.frames)

#11 Meta-data Pointing R to the appropriate folder to get information 
#   from “features.txt” and “activity_labels.txt”
    
    setwd(paste(initial.wd, "/UCI HAR Dataset", sep=""))
    
#12 Meta_data:Extracting features names as character/not a factor
    
    features.names<-as.character(read.table("features.txt", sep="")[,2])
    
#13 Meta-data: Extracting activities labels and levels
    
    activity.levels<-as.character(read.table("activity_labels.txt", sep="")[,1])
    
    activity.labels<-as.character(read.table("activity_labels.txt", sep="")[,2])

    
#14 Meta-data:Naming the combined X file variables with the features names
    
    names(X)<-features.names
    
#15 Just cleaning
    
    rm(features.names)
    
#16 Selecting only the measurements on the mean and standard deviation 
#   for each measurement as per project instructions. 
    
    selected.variables.names<-grep(("-mean()|-std()"), names(X), value=T)
    
#17 Step 16 filter brings some “noise” (variables with name -meanFreq()) 
#   that are filtered off here
    refined.selected.variables.names<-selected.variables.names[-grep("meanFreq",selected.variables.names)]
    
#18 Subsetting the features data frame to keep only those variables as per project instructions
    
        X.reduced<-X[, refined.selected.variables.names]
    
#19 Cleaning
    
        rm(X, selected.variables.names, refined.selected.variables.names)
    
#20 Meta-data: Naming “subjects” and “activities”

    names(y)<-"activity"
    
    names(subject)<-"subject"

#21 Combining selected features with subjects and activities
    
    c.data<-cbind(subject,y,X.reduced)

#22 Cleaning, what else?
    
    rm(X.reduced, y, subject)
    
#23 Meta-data: Link activities with proper levels and labels previously extracted
    
    c.data$activity<-factor(c.data$activity, levels=activity.levels, labels=activity.labels)
    
#24 Cleaning
    
    rm(activity.labels,activity.levels)

#25 Pointing R to the wd where tidy data is going to be written.
    
    setwd(initial.wd)
    
#26 Calling dplyr package for handling data in a easier way
    
    library(dplyr)
    
#27 Chained data manipulation to get the tidy.data.set:
#   a) declaring c.data as tbl_df class object to apply dplyr verbs for easier manipulation; 
#   b) grouping by activity and subject; 
#   c) applying the mean as a summary function to each of the non grouping variables.


    tidy.data.set<-c.data%>%tbl_df()%>%group_by(activity,subject)%>%summarise_each(funs(mean))

#28 Writing the file “tidy_data.set.txt”
    
    write.table(tidy.data.set, file="tidy_data_set.txt", row.names=F, col.names=T)

#29 Detaching plyr……and cleaning

detach("package:dplyr");rm(c.data)


