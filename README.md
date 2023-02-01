# IFS_SNPpairs
Incremental feature selection (IFS) of SNP pairs by combining only the best single SNPs to pairs based on the variable importance estimates from Boruta. 

IFS_SNPpairs.R:  
An R script that performs IFS with the SNP pairs created with the best SNPs based on the variable importance estimates from Boruta.
The R script depends on the R function create_SNPpairs() and requires a separated test and training data set.

create_SNPpairs.R:  
Function to create SNP pairs from certain SNPs in a data set. 
Requires a vector that contains names of SNPs to be combined to SNP pairs and a data frame with phenotypic and genomic data from single SNPs. Genomic data must be in form of 0, 1, 2 coding. 
Returns a data frame with SNP pairs from the single SNPs in the input with phenotypic and genomic data.

TestData.csv:  
Example of a test data set from a genomic prediction trial to screen rhizomania resistance in sugar beet. 

TrainingData.csv:  
Example of a training data set from a genomic prediction trial to screen rhizomania resistance in sugar beet. 
