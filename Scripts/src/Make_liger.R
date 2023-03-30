##Create liger object
## TODO : une meilleure descrption

make_liger_object <- function(X, n_rna, n_prot, g, z_rna, z_prot, k){
  rna <- X[[1]]
  protein <- X[[2]]
  
  rnaGenes <- paste0("gene", 1:(z_rna + g))
  rownames(rna) <- rnaGenes
  
  proteinGenes <- paste0("gene", (z_rna + 1):(z_rna + z_prot + g))
  rownames(protein) <- proteinGenes
  
  colnames(rna) <- paste0("cell", 1:n_rna)
  colnames(protein) <- paste0("cell", (n_rna + 1):(n_rna + n_prot))
  
  lig <- createLiger(list(rna = rna,
                          protein = protein),
                     take.gene.union = FALSE,
                     remove.missing = TRUE)
  
  lig@var.genes <- intersect(rownames(protein), rownames(rna))

  
  lig@var.unshared.features <- list(rna = rownames(rna)[!rownames(rna) %in% lig@var.genes],
                                    protein = rownames(protein)[!rownames(protein) %in% lig@var.genes])
  lapply(lig@var.unshared.features, length)

  lig <- rliger::normalize(lig)

  lig <- scaleNotCenter(object = lig,
                        remove.missing = TRUE)

  return(lig)
  
}

## TODO : trouver un moyen de conserver les differentes facto (utiliser seed)
save_factorisation <-function(V, U, W, H, seed){
  V_1 <-V
  U_1 <-U
  W_1 <-W
  H_1 <-H
}




