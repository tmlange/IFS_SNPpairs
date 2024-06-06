# IFS_SNPpairs
Incremental feature selection (IFS) of SNP pairs by combining only the single SNPs with the highest variable importance to pairs. 

IFS_SNPpairs.R:  
An R script that performs IFS with the SNP pairs created with the best SNPs based on the variable importance estimates from Boruta.
The R script produces a training data set containing 80% of the individuals and a test data set containing the remaining individuals. 
Furthermore, the data set needs to provide phenotypic values in the first column as well as genomic data in the following columns in form of 0, 1, 2 coding. 
The genotype of the SNP pairs is defined as the product of the single SNPs used in the SNP pair. 

TrialData.csv:  
Example data set from a genomic prediction trial to screen rhizomania resistance in sugar beet where 156 genotypes were genotyped with 9,127 SNPs. 

The first column contains the IDs of the genotypes used the trial. 155 genotypes were S2 lines, resistant at the two known resistance clusters Rz1 and Rz2. 
The population was extended with a genotype which was resistant at Rz1 but susceptible at Rz2 (in the data set represented as Control_susceptibleRz2). 
The second column contains the phenotypic data as relative virus concentrations in the roots of plants that were cultivated for ten weeks in soil naturally infested with the Beet necrotic yellow vein virus, pathotype P.
Measurement of the relative virus concentration followed the protocol described in Lange et al. (2022) "Non-linear transformation of enzyme-linked immunosorbent assay (ELISA) measurements allows usage of linear models for data analysis" using the R script TransformELISA.R available at https://github.com/tmlange/TransformELISA. 
The following 9,127 columns contain SNP data. Each SNP was recoded as 0 (homozygous major allele), 1 (heterozygous), and 2 (homozygous minor allele). 


# Requirements
R 4.1.2 or higher
R packages ranger and Boruta

# Licenses
The software is licensed under the MIT license. The data set is licensed under the Creative Commons Legal Code (CC0 1.0 Universal). For further details see the LICENSES file. 

# Citation
If you use this software, please cite it as below:

DOI: 
https://doi.org/10.12688/f1000research.131134.1

APA:
Lange, T. M., Heinrich, F., Kopisch-Obuch, F., Keunecke, H., Gültas, M., & Schmitt, A. O. (2023). Improving genomic prediction of rhizomania resistance in 
sugar beet (Beta vulgaris L.) by implementing epistatic effects and feature selection. F1000Research, 12(280), 280.

BibTeX:
@article{,
  title={Improving genomic prediction of rhizomania resistance in sugar beet (Beta vulgaris L.) by implementing epistatic effects and feature selection},
  author={Lange, Thomas M. and Heinrich, Felix and Kopisch-Obuch, Friedrich and Keunecke, Harald and G{\"u}ltas, Mehmet and Schmitt, Armin O.},
  journal={F1000Research},
  volume={12},
  number={280},
  pages={280},
  year={2023},
  publisher={F1000 Research Limited}
}
