run_analysis <- function() {
  
  ## Folder Names
  datasetFolder <- "UCI HAR Dataset"
  tidyDatasetFolder <- "UCI HAR Tidy Dataset"
  testFolder <- "test"
  trainFolder <- "train"
  inertialSignalsFolder <- "Inertial Signals"
  
  ## File Names
  features_info <- "features_info.txt"
  
  if(file.exists(datasetFolder)){
    
    #   ## File Names
    #   ##  Test Files
    #   testFiles <- c("body_acc_x_test.txt","body_acc_y_test.txt","body_acc_z_test.txt","body_gyro_x_test.txt","body_gyro_y_test.txt","body_gyro_z_test.txt","total_acc_x_test.txt","total_acc_y_test.txt","total_acc_z_test.txt")
    #   ##  Train Files
    #   trainFiles <- c("body_acc_x_train.txt","body_acc_y_train.txt","body_acc_z_train.txt","body_gyro_x_train.txt","body_gyro_y_train.txt","body_gyro_z_train.txt","total_acc_x_train.txt","total_acc_y_train.txt","total_acc_z_train.txt")  
    #   
    #   ## Paths
    #   ##  Test Paths
    #   testPaths <- file.path(getwd(),datasetFolder,testFolder,inertialSignalsFolder,testFiles)
    #   ##  Train Paths
    #   trainPaths <- file.path(getwd(),datasetFolder,trainFolder,inertialSignalsFolder,trainFiles)
    #   
    #   ## Reads given test files using read.table function
    #   testData <- lapply(testPaths, read.table)
    #   
    #   ## Reads given train files using read.table function
    #   trainData <- lapply(testPaths, read.table)
    #   
    #   ## STEP1 Merges the training and the test sets to create one data set.
    #   body_acc_x <- rbind(testData[[1]],trainData[[1]])
    #   body_acc_y <- rbind(testData[[2]],trainData[[2]])
    #   body_acc_z <- rbind(testData[[3]],trainData[[3]])
    #   body_gyro_x <- rbind(testData[[4]],trainData[[4]])
    #   body_gyro_y <- rbind(testData[[5]],trainData[[5]])
    #   body_gyro_z <- rbind(testData[[6]],trainData[[6]])
    #   total_acc_x <- rbind(testData[[7]],trainData[[7]])
    #   total_acc_y <- rbind(testData[[8]],trainData[[8]])
    #   total_acc_z <- rbind(testData[[9]],trainData[[9]])
    
    message("STEP1...")
    features <- read.table(file.path(getwd(),datasetFolder,"features.txt"))
    features <- features[,2] ## Gets rid of unnecessary column
    testSet <- read.table(file.path(getwd(),datasetFolder,testFolder,"X_test.txt"), col.names=features)
    trainingSet <- read.table(file.path(getwd(),datasetFolder,trainFolder,"X_train.txt"), col.names=features)
    
    ## STEP1 Merges the training and the test sets to create one data set.
    dataSet <- rbind(testSet, trainingSet)
    message("STEP1...COMPLETED")
    
    message("STEP2...")
    ## STEP2 Extracts only the measurements on the mean and standard deviation for each measurement.
    ## Do I need meanFreq? I think I don't...
    meanAndStdFeatures <- features[grep("mean\\(\\)|std\\(\\)",features)]
    dataSet <- dataSet[,meanAndStdFeatures] ## No need the old dataSet anymore
    message("STEP2...COMPLETED")
    message("STEP3...")
    ## STEP3 Uses descriptive activity names to name the activities in the data set
    testLabels <- read.table(file.path(getwd(),datasetFolder,testFolder,"y_test.txt"), col.names="ACTIVITY_ID")
    trainingLabels <- read.table(file.path(getwd(),datasetFolder,trainFolder,"y_train.txt"), col.names="ACTIVITY_ID")
    labels <- rbind(testLabels, trainingLabels)
    activityNames <- read.table(file.path(getwd(),datasetFolder,"activity_labels.txt"), col.names=c("ACTIVITY_ID","ACTIVITY_NAME"))
    
    ## Must use plyr library
    if("plyr" %in% rownames(installed.packages()) == FALSE) {
      install.packages("plyr")
    }
    library("plyr") ## IT REQUIRES INSTALLATION... install.packages("plyr")
    head
    activities <- join(x=labels,y=activityNames) ## IT KEEPS THE ORDER OF X!
    activities <- activities$ACTIVITY_NAME ## No need ACTIVITY_ID anymore
    
    message("STEP3...COMPLETED")
    message("STEP4...")
    ## STEP4 Appropriately labels the data set with descriptive variable names. 
    dataSetWithActivities <- cbind(activities,dataSet)
    
    #     ## STEP5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    #     if(!file.exists(tidyDatasetFolder)){
    #       if(!dir.create(tidyDatasetFolder)){
    #         stop("Can't create folder:" + tidyDatasetFolder)
    #       }
    #       write.table(dataSetWithActivities,file = file.path(getwd(),tidyDatasetFolder,"set.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE) ## Puts pure data into a txt file. 
    #       extendedFeatures <- cbind(1:length(meanAndStdFeatures),as.vector(features[meanAndStdFeatures]))
    #       write.table(extendedFeatures,file = file.path(getwd(),tidyDatasetFolder,"features.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE) ## Puts features into a txt file just like in the UCI HAR Dataset folder.     
    #     ## Since new feature set is a subset of old feature set... just copying file
    #       file.copy(file.path(getwd(),datasetFolder,features_info),file.path(getwd(),tidyDatasetFolder,features_info),overwrite=TRUE)
    #    ## Creates activities file (using unique)
    #    write.table(unique(activities),file = file.path(getwd(),tidyDatasetFolder,"activities.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE)
    #    
    #     }
    #    ## NOPE! Since coursera (supports: txt, png, jpg, gif, pdf) it must be only one file.......
    
    message("STEP4...COMPLETED")
    message("STEP5...")
    ## STEP5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    testSubjects <- read.table(file.path(getwd(),datasetFolder,testFolder,"subject_test.txt"), col.names="SUBJECT")
    trainingSubjects <- read.table(file.path(getwd(),datasetFolder,trainFolder,"subject_train.txt"), col.names="SUBJECT")
    subjects <- rbind(testSubjects,trainingSubjects)
        
    ## find the mean of variables depending on activity and subject
    tidySet <- aggregate(dataSet, by = list(activity = dataSetWithActivities$activities, subject = subjects[[1]]), mean) ## Why I generated dataSetWithActivities !?    
    
    ## Need to rename column names (except activity and subject)
    titles <- names(tidySet)
    titles[3:length(titles)] <- paste(as.list(rep("AVG_", length(titles)-2)),titles[3:length(titles)],sep="")
    names(tidySet) <- titles
    
    ## Write tidySet to a file
    write.table(tidySet,file = file.path(getwd(),"tidySet.txt"), col.names=FALSE, row.names=FALSE, quote=FALSE)
    
    message("STEP5...COMPLETED")
  }else{
    stop(datasetFolder + " doesn't exist in the current working directory (" + getwd() + ")" )
  }
  return(tidySet)
}