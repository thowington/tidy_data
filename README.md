The script "run_analysis.r" creates a tidy dataset from the UCI HAR Dataset.


The script performs these functions:

1) reads in data from the training and testing directories,
2) reads in activites and activitiy descriptions,
3) determines which variabls from the original dataset are of interest here, namely those  involving mean(0 adn std(),
4) combines the training and testing datasets into one combined dataset,
5) adds descriptive variable names to the dataset, 
6) substitues the activity descriptions for the activity numbers,
7) melts the dataframe to achieve a "long-form" table
8) divides the original variable descriptions into three separate variables,
9) groups the new data by subject, activity, measurement function,adn axis,
10) converts character values to factors, and
11) writes out the new tidy dataset as "tidy_measurements.txt."
