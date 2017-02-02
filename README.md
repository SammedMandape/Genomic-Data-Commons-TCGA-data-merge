# The cancer genome atlas (TCGA): Genomic Data Commons data-merge

This R code is to merge all the expression values for all downloaded cases of interest. Assumption here is that all the gene ids will be same or from same platform across all cases of interest. Data from different platform cannot be combined using this code. The final output is a file with first column as gene ids and all remaining columns consisting of expression values for all cases. 
The column name indicates the name of the file the expression values belong to.
