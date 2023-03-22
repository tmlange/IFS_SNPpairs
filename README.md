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
