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
