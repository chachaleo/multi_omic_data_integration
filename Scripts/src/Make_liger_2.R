##Create liger object
## TODO : une meilleure descrption

make_liger_object <- function(X, n_rna, n_prot, g, z_rna, z_prot, k){
  rna <- X[[1]]
  protein <- X[[2]]
  
  rnaGenes <- paste0("gene", append((z_rna+1):(z_rna + g),1:z_rna))
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


make_liger_object_not_scaled <- function(X, n_rna, n_prot, g, z_rna, z_prot, k){
  rna <- X[[1]]
  protein <- X[[2]]
  
  rnaGenes <- paste0("gene", append((z_rna+1):(z_rna + g),1:z_rna))
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

  lig@norm.data$rna@x = lig@raw.data$rna@x
  lig@norm.data$protein@x = lig@raw.data$protein@x

  lig@scale.data[[1]] <- t(as.matrix(lig@norm.data$rna))[,1:g]
  lig@scale.data[[2]] <- t(as.matrix(lig@norm.data$protein))[,1:g]

  lig@scale.unshared.data[[1]] <- as.matrix(lig@norm.data$rna)[(g+1):(g+z_rna),]
  lig@scale.unshared.data[[2]] <- as.matrix(lig@norm.data$protein)[(g+1):(g+z_prot),]


  return(lig)
  
}



make_zero_partial <- function(k, z_rna, z_prot) {
  zero_matrix_u_partial <- c()
  zero_matrix_u_partial[[1]] <- matrix(0, nrow = k, ncol = z_rna)
  zero_matrix_u_partial[[2]] <- matrix(0, nrow = k, ncol = z_prot)
  return(zero_matrix_u_partial)
  
}

make_zero_full <- function(z_rna, z_prot, n_rna, n_prot) {
  zero_matrix_u_full <- c()
  zero_matrix_u_full[[1]] <- matrix(0, nrow = z_rna, ncol =  n_rna + n_prot)
  zero_matrix_u_full[[2]] <- matrix(0, nrow = z_prot, ncol = n_rna +  n_prot)
  return(zero_matrix_u_full)
}

make_X_list <- function(W, zero_matrix_u_partial, V, U, H) {
  X = list()
  X[[1]] <- (rbind(t(W),t(zero_matrix_u_partial[[1]])) + rbind(t(V[[1]]),t(U[[1]]))) %*% t(H[[1]])
  X[[2]] <- (rbind(t(W),t(zero_matrix_u_partial[[2]])) + rbind(t(V[[2]]),t(U[[2]]))) %*% t(H[[2]])
  X <- add_error(X)
  return(X) 
}


