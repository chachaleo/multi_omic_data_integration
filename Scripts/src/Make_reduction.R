library(scater)
library(ggplot2)

## TODO : faire fct qui UMAP et qui PCA


## param Hnorm = lig@H.norm
make_PCA  <- function(Hnorm){
  pca <- calculatePCA(Hnorm,
                      ncomponents = 2
                      )
  rownames(pca) <- rownames(Hnorm)
  
  df <- data.frame(PCA = pca)
  df$Modality <- ifelse(startsWith(rownames(df), "i"), "protein", "rna")
  gg <- ggplot(df) +
    aes(x = PCA.1,
        y = PCA.2,
        colour = Modality) +
    xlab("PCA 1") +
    ylab("PCA 2")
}


make_UMAP <- function(Hnorm, lig){
  umap <- calculateUMAP(Hnorm,
                        ncomponents = 2,
                        scale = TRUE,
                        n_neighbors = 10,
                        transpose = TRUE)
  
  rownames(umap) <- rownames(Hnorm,lig)
  
  df <- data.frame(UMAP = umap)
  ##df <- cbind(df, colData(mae)[rownames(df), ])
  df$Modality <- ifelse(startsWith(rownames(df), "i"), "protein", "rna")
  gg <- ggplot(df) +
    aes(x = UMAP.1,
        y = UMAP.2,
        colour = Modality) +
    geom_point(size = 0.5, alpha = 0.3) +
    theme_minimal() +
    theme(legend.position = "bottom") +
    xlab("UMAP 1") +
    ylab("UMAP 2")
  gg + scale_colour_manual(values = c("#7332a8", "orange2"),
                           na.value = "grey")
}


