## Detailed step by step explanation of this code in "README
## It assumes you have "UCI HAR Dataset" FOLDER placed in the current wd

#1
    initial.wd<-getwd()
#2
    setwd(paste(initial.wd, "/UCI HAR Dataset/train", sep=""))  
#3
    list.train.files<-grep("_train", list.files(), value=T)
#4
    train.data.frames<-lapply(list.train.files,function(x) {read.table(x, sep="")})
#5
    setwd(paste(initial.wd, "/UCI HAR Dataset/test", sep=""))
#6
    list.test.files<-grep("_test", list.files(), value=T)
#7  
    test.data.frames<-lapply(list.test.files,function(x) {read.table(x, sep="")})

#8   
    names.for.combined.data.frames<-sub("_train.txt","",list.train.files)
#9
    
for (i in seq_along(names.for.combined.data.frames)){
        assign(
            names.for.combined.data.frames[i],
            rbind.data.frame(train.data.frames[[i]], test.data.frames[[i]])
                 )}
#10
    rm(i, list.test.files, list.train.files, names.for.combined.data.frames,
       test.data.frames, train.data.frames)

#11 
    
    setwd(paste(initial.wd, "/UCI HAR Dataset", sep=""))
#12
    features.names<-as.character(read.table("features.txt", sep="")[,2])
#13
    
    activity.levels<-as.character(read.table("activity_labels.txt", sep="")[,1])
    
    activity.labels<-as.character(read.table("activity_labels.txt", sep="")[,2])

#14
    names(X)<-features.names
#15
    rm(features.names)
#16  
    selected.variables.names<-grep(("-mean()|-std()"), names(X), value=T)
#17
    refined.selected.variables.names<-selected.variables.names[-grep("meanFreq",selected.variables.names)]
#18
    
        X.reduced<-X[, refined.selected.variables.names]
#19
        rm(X, selected.variables.names, refined.selected.variables.names)
#20

    names(y)<-"activity"
    
    names(subject)<-"subject"

#21
    c.data<-cbind(subject,y,X.reduced)
#22
    rm(X.reduced, y, subject)
    
#23
    c.data$activity<-factor(c.data$activity, levels=activity.levels, labels=activity.labels)
#24
    rm(activity.labels,activity.levels)

#25
    setwd(initial.wd)
#26
    library(dplyr)
#27

    tidy.data.set<-c.data%>%tbl_df()%>%group_by(activity,subject)%>%summarise_each(funs(mean))

#28 
    write.table(tidy.data.set, file="tidy_data_set.txt", row.names=F, col.names=T)

#29

detach("package:dplyr");rm(c.data)


