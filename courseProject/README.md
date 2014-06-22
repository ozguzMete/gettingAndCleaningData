## How run_analysis.R Works?

### How to Run?
* Open file in R Studio
* Set the folder, which holds UCI HAR Dataset folder, as your working directory
* Load function
* Call Function
* Relax and Wait for tidySet.txt appearance

### What does the code do?
* Initializes variables which will hold the necessary folder and files names for computing
* Cheks UCI HAR Dataset folder exist or not (if it isn't available, stops computing)
* Gets features
* Gets Test Set
* Gets Training Set
* Merges Test and Training Sets
* Finds features that have the word mean() or std()
* Chops the merged set using the above features
* Gets Test Labels
* Gets Training Labels
* Merges Test and Training Labels
* Gets Activity Labels
* Loads/Installs plyr library (need for join function)
* Using join function, generates activities using merged and activity labels
* Appropriately labels the data set with descriptive variable names. 
* Gets Test Subjects
* Gets Training Subjects
* Merges Test and Training Subjects
* Finds the mean of variables depending on activity and subject using aggregate function
* Renames column names (except activity and subject) since the meaning of data has changed
* Writes tidySet to a file named tidySet.txt