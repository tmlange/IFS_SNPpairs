# Create_SNPpairs.R

# An R script to create SNP pairs with the single SNPs 
# that provide the highest variable importance.



#### Preparation of the script ####

# Please install the following packages prior to performing the analysis
library("ranger")
library("Boruta")

# Read in the provided example data or your own training and test data
Training = read.table("TrainingData.csv", sep=";", header=T)
Test = read.table("TestData.csv", sep=";", header=T)

# Choose the number of threads that you want to use
thread.number = 60

# Choose the smallest number of single SNPs you want to use to create SNP pairs
min.snps = 3

# Choose the maximum number of single SNPs you want to use to create SNP pairs
max.snps = 20

# Create the function create_SNPpairs()
create_SNPpairs = function(selectedSNPs, D){
  
  # Combining the single SNPs to SNP pairs
  comb = combn(selectedSNPs, 2)
  comb = as.data.frame(comb)
  comb = t(comb)
  
  
  # Defining the genotype and phenotype of the SNP pairs with the provided data set
  D_SNPpairs = D[,1]
  D_SNPpairs = as.data.frame(D_SNPpairs)
  names(D_SNPpairs) = "PHENOTYPE"
  for(i in 1:nrow(comb)){
    geno_SNP1 = D[,comb[i,1]]
    geno_SNP2 = D[,comb[i,2]]
    geno_SNPpair = geno_SNP1*geno_SNP2
    
    D_SNPpairs = cbind(D_SNPpairs, geno_SNPpair)
    names(D_SNPpairs)[i+1] = paste(comb[i,1], comb[i,2], sep= "_")
  }
  
  return(D_SNPpairs)
}




#### Analysing variable importance of single SNPs ####

# First step, estimate the variable importance of the single SNPs. 
# Then, SNPs will be sorted based on their variable importance. 
# Hyperparameters in the Boruta function can be adjusted. 
# I assume smaller values for the pValue and higher values for the ntree argument 
# will lead to more stable estimations of the variable importances. 
Boruta.var.Importance = Boruta(y=Training[,1] , x=Training[,-1], doTrace=0, ntree=2000, num.threads = thread.number,
                               pValue=10^-10, maxRuns = 200, mcAdj = TRUE)
VI_result <- attStats(Boruta.var.Importance)
VI_result$SNP = row.names(VI_result)
VI_result = VI_result[order(VI_result$meanImp, decreasing=T),]
# The data frame VI_result contains the SNPs sorted by their mean variable importance.
# Next to this, the data frame contains also all the other measures of variable importance 
# that are provided by the Boruta function. 



#### Perform genomic prediction with the SNP pairs ####

result = data.frame()
for(n in min.snps:max.snps){
  
  # Creating a data set for the SNP pairs for both the training and test data using the function create_SNPpairs()
  selectedSNPs = VI_result$SNP[1:n]
  Tr_SNPpairs = create_SNPpairs(selectedSNPs, Training)
  Test_SNPpairs = create_SNPpairs(selectedSNPs, Test)
  
  
  # Performing genomic prediction with the newly created SNP pair data set
  # During genomic prediction, prediction accuracy is defined as median R2 from ten repetitions
  Rsquared_GP_SNPpairs = vector()
  for(rep in 1:10){
    
    # Performing genomic prediction using random forest with the ranger function
    myForest <- ranger(x=Tr_SNPpairs[,-1],
                       y=Tr_SNPpairs[,1],
                       num.threads = thread.number,
                       verbose = FALSE, 
                       write.forest = TRUE)
    prediction_RF <- predict(myForest, data=Test_SNPpairs[,-1])$predictions
    actual <- Test_SNPpairs[,1]
    Rsquared_GP_SNPpairs[rep] = 1 - sum((prediction_RF - actual) ^ 2)/ sum((actual - mean(actual)) ^ 2)
  }
  
  # Storing the result from the genomic prediction with the n best SNPs being combined to SNP pairs 
  tmp = data.frame(pred.acc = median(Rsquared_GP_SNPpairs), selectedSNPs = n)
  result = rbind(result, tmp)
}

cat("Prediction accuracy maximises at", round(result[result$pred.acc==max(result$pred.acc),]$pred.acc, 4),
    "with", result[result$pred.acc==max(result$pred.acc),]$selectedSNPs,
    "SNPs being combined to SNP pairs.")



#### Visualisation of the results ####
plot(result$pred.acc ~ result$selectedSNPs, 
     pch=16, col="navyblue",
     ylab="Prediction accuracy", 
     xlab="Number of best SNPs combined to pairs")
