# DFD
Get Drugs From Differential expression profile

[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/DFD?color=blue)](https://CRAN.R-project.org/package=DFD) 
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/DFD)](https://CRAN.R-project.org/package=DFD) 
[![](https://www.r-pkg.org/badges/version/DFD?color=green)](https://CRAN.R-project.org/package=DFD) 

# Installation

```R
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("signatureSearch")
BiocManager::install("signatureSearchData")
install.packages("DFD ")
```
# Description

Get Drug information from given differentail expression profile.
The package search for the bioactive compounds from reference databases such as LINCS containing the genome-wide GESs from tens of thousands of drug and genetic perturbations [Subramanian et al. 2017](https://www.cell.com/cell/fulltext/S0092-8674(17)31309-0). 

# Pipeline
- The package process the differential expression profile by converting the gene symbols (Human or Mouse) to entrez ids.
- The processed IDs is the passed to signature search matching the input differential expression to reference differential expression in [LINCS](https://www.cell.com/cell/fulltext/S0092-8674(17)31309-0) database.
- The pacakge search for the perturbagens (Drugs) that are assocaited with matched differential expression
- Re-raking step is performed as a last step in order to prioritize drugs that have the maximum number of targets

# Documentation

For the documentation see: [DFD Documentation](https://cran.r-project.org/web/packages/DFD/DFD.pdf).

# Package information

- link to package on CRAN: [DFD](https://cran.r-project.org/package=DFD)

# Usage

**Example**

```R
library(DFD)
library(signatureSearch)
perts <- run_pipeline(degs_path = "https://raw.githubusercontent.com/MohmedSoudy/datasharing/master/differential-expression.csv",
                      output_path = getwd())
```
# Sample input and output 

- [Sample Input](https://raw.githubusercontent.com/MohmedSoudy/datasharing/master/differential-expression.csv)
- [Sample Output](https://raw.githubusercontent.com/MohmedSoudy/datasharing/master/Predicted_drugs.csv)
  
# Contribution Guidelines

For bugs and suggestions, the most effective way is by raising an issue on the github issue tracker. Github allows you to classify your issues so that we know if it is a bug report, feature request or feedback to the authors.
