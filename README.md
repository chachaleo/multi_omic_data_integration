# integration of single cell multi-omics data

### Project description

For the last decades, biology and biomedical sciences have seen an
impressive increase in the size of the data that are collected as part
of routine research projects. The increase in amount and complexity of
such data leads some to call it a data deluge. Indeed, we have reached
a situation where the sheer volume of data that is produced is
overwhelming the capacity of individual researchers and research
groups to manage, analyze and extract meaningful information from
them. This revolution is shifting biomedical research towards the
quantitative side of science, and has been driven by the technological
breakthroughs and the advent of omics technologies that measure
biological molecules in a high throughput way.

As opposed to bulk omics approaches, that average the measurements
across millions of heterogeneous cells, single cell technologies allow
researchers to assay individual cells and investigate cell-to-cell
differences. Single cell technologies refine our understanding of cell
types and cell states and help redefine much of our understanding of
the biology of heterogeneous cell populations, tissues and cell
differentiation. One of the leading technologies is single cell RNA
sequencing (scRNA-Seq), that leverages the power of high-throughput
sequencing to quantify messenger RNA molecules in individual
cells. More recently, mass spectrometry-based single cell proteomics
approaches (SCP) have also been proposed, notably by [Specht et
al. (2021)](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-021-02267-5). They
have characterised the heterogeneity of monocytes and macrophages,
innate immune cells with diverse functional and molecular phenotypes,
using scRNA-Seq and SCP technologies. The datasets comprise the
quantitation of 3042 proteins in 1490 cells (1096 macrophages and 394
monocytes), and 32738 mRNAs in 20274 other, unannotated cells.

This goal of this project is to (1) identify clusters of cells based
either single and integrate omics modalities to infer cell populations
and their heterogeneity and (2) transfer the monocyte and macrophage
labels from the proteomics data onto the unannotated RNA data.

### References

https://paperpile.com/shared/E1ALAI

### Data

RNA expression
- expression data in `./data/rna_expression.csv.gz` (1.3GB uncompressed!)
- RNA data are raw counts, including many 0.
- sample annotations in `./data/rna_sample_annotation.csv`
- 32738 genes
- 20274 cells
- no cell annotation
- experimental batch

Protein abundances
- expression data in `./data/protein_expression.csv.gz`
- Protein data have been normalized, log transformed, imputed and
  batch corrected. Detailed information about the data processing is
  available in [another
  vignette](https://uclouvain-cbio.github.io/SCP.replication/articles/SCoPE2.html).
- sample annotations in `./data/protein_sample_annotation.csv`
- 3042 proteins
- 1490 cells
- cells annotated as Macrophage or Monocyte
- experimental batches
