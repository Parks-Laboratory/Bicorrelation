## Adjusting codes
### Read  in Data
1. Give the name of the data file to the variable named option.(option = "FEMALE.txt" in sample codes)
2. Specify the number of rows contained in the data file.(apoE<-read.table(option,nrows = 1000) in sample codes,change 1000 to the number of rows in your data file)
### Data cleaning
The data matrix after data cleaning should be a matrix whose column names are gene names and each row represents for observations of one individual over all different genes.(apoE_mat_num in sample codes)
### Organize the output
1. You can change the desired p-value for your needs.(result <- result[result$p<0.1,] in sample codes, you may change 0.1 to another value) 
### Save the result
1. Change the name of your output.(save(result,file = "2_apoE_FEMALE_bicorr.Rdata") in sample codes)


## Running the bicor codes on the cluster
1. Make a separate directory called bicor/
2. Make a separate directory called node_files/ inside the bicor/ directory
3. Transfer data file and R file into node_files/ directory
4. Edit the bicor.sh file: in the last line change the name of the bicorrelation script to the correct file
5. Copy R.tar.gz from cluster into the bicor/ directory
6. Run the command condor_submit bicor.sub
