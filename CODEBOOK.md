CodeBook
============================

Details About Variables Used and Transformations Applied Step By Step

============================



1. Read files X_test,X_train.y_test,y_train,Subject_test,Subject_train,features and activity_lables text files into dataframes

2. Column bind Dataframes y_test and subject_test and add column names Activity and Subject to it. ->A

3. Column bind Dataframes y_train and subject_train and add column names Activity and Subject to it. ->B

4. Merge A and B (dim-10299*2) -> C

5. Merge X_train and X_test data -> D (dim-10299*561)

6. Change column names of D from features.txt

7. Eliminate columns from D which do not have "mean()" or "std()" in the column names. ->E (dim-10299*66)

8. Column bind C and E (dim-10299*68) <- finalDS

9. Taken  mean of observations per activity per subject. (dim-180*68) <- output
. 
10. Replace activity numbers with Activity names from activity_lables.txt-> output

11. used write.table to get a text file from the above Data Frame.Submit this text file f

===========================

***Thank You ***
