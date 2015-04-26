#To run the script:
**First,** Open the script in RStudio, Click (Ctrl+A) to select the script then click Run or (Ctrl +Enter).

**Second,** Call the function: `tidyData(dir)`
where dir = String for the location of the Samsung data in your PC.

The script generates a file called **"tidyData.txt"** in the working directory.
The file contains the output tidy data set with the average of each variable for each activity and each subject.

To read the output file, Enter the command:
`dat <- read.table("tidyData.txt")`
Use the commands: `head(dat)` or `str(dat)` or `summary(dat)`
to view the file's header & summary.

##How run_analysis.R Script Works:

1. The Script reads Training set & labels using `read.table`.
2. Read Test set & labels using `read.table`.
3. Combine Train & Test Labels using `rbind`.
4. Read list of all Features using `read.table`.
5. Merge Training and Test sets into one data set using `rbind`.
6. Get Column Numbers for Mean & Standard Deviation using `grep`.
7. Extract only the measurements on the mean and standard deviation for each measurement, & store them in a new data frame called **data**.
8. Combine Activity Labels with Data set using `cbind`.
9. Appropriately label the data set with descriptive variable names from 'features.txt'.
10. Use descriptive activity names to name the activities in the data set from 'activity_labels.txt'.
11. Read Subject_train & Subject_test data.
12. Merge Subject data with data set using `cbind`.
13. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
   1. Use **dplyr** package to group data by activity & subject.
   2. Use `summarise_each` function to calculate the Mean of each variable.
14. Write New tidy Data set to text file using `write.table`.
