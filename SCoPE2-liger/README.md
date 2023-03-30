# Integrate scRNA-Seq and MS-SCP data

The integration performed in this vignette uses the UINMF algorithm
described in [Kriebel et
al. 2021](http://dx.doi.org/10.1101/2021.04.09.439160).  The algorithm
decomposes the data ($[E_1, P_1]$ and [E_2, P_2]) in different latent
components. The underlying model is illustrated in this figure taken
from the original article.


![UINMF model](UINMF_model.png)

- The $H_1$ and $H_2$ components contain the latent factors that
  describe the cell space.
- The $W$ component contains the latent factors in the feature space that
  are shared across modalities.
- The $V_1$ and $V_2$ components capture the specific effects in each
  modality on the feature expression are specific to their
  corresponding modality.
- The $U_1$ and $U_2$ matrices contain the latent feature space only
  for the unshared features, that are features found only in one of
  the modalities

The UINMF algorithm is available from the `liger` package. Currently, this
available on the `U_algorithm` branch of the GitHub repository.

The data are available in the `data` directory:

- `rna_expression.csv.gz` contains RNA expression data.
- `protein_expression.csv.gz` contains protein abundance data.
- `protein_sample_annotation.cvs` contains the annotation of the cells
  in the protein data.
- `rna_sample_annotation.cvs` contains the annotation of the cells in
  the RNA data.

The table below show the numbe of features that are shared between the
two modalities (2520) and those unique to the proteomics data (384)
and the RNA data (20035).

|      | FALSE| TRUE|
|:-----|-----:|----:|
|FALSE |     0|  384|
|TRUE  | 20035| 2520|

## Package installations

```r
if (!require("BiocManager"))
    install.packages("BiocManager")

BiocManager::install(version = "3.14")

BiocManager::install("SingleCellMultiModal")
BiocManager::install("scuttle")
BiocManager::install("scran")
BiocManager::install("tidyverse")
BiocManager::install("biomaRt")
BiocManager::install("scater")
BiocManager::install("scran")
BiocManager::install("knitr")
BiocManager::install("rmarkdown")
BiocManager::install("igraph")

BiocManager::install("welch-lab/liger")
library(rliger)
```

## Rendering

```r
rmarkdown::render("SCoPE2_integration.Rmd")
```
