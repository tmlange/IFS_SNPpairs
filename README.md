# IFS_SNPpairs
Incremental feature selection (IFS) of SNP pairs by combining only the best single SNPs to pairs based on the variable importance estimates from Boruta. 

IFS_SNPpairs.R:  
An R script that performs IFS with the SNP pairs created with the best SNPs based on the variable importance estimates from Boruta.
The R script requires a separated test and training data set which both need to provide phenotypic values in the first column as well as genomic data in the following columns in form of 0, 1, 2 coding. 

TestData.csv:  
Example of a test data set from a genomic prediction trial to screen rhizomania resistance in sugar beet. 

TrainingData.csv:  
Example of a training data set from a genomic prediction trial to screen rhizomania resistance in sugar beet. 

# Requirements
R 4.1.2 or higher
R packages ranger and Boruta

# Licenses
The software is licensed under the MIT license. The data set is licensed under the Creative Commons Legal Code (CC0 1.0 Universal). For further details see the LICENSES file. 
