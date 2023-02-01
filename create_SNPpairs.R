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
