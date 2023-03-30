## Generate data

## dim: n_i x k


make_H_list <- function(n_rna, n_prot, k) {
  k <- 3
  m <- 21
  
  H_norm_1 <- matrix(n_rna:1, nrow = n_rna, ncol = 1)
  H_norm_1 <- cbind(H_norm_1,matrix(1:n_rna, nrow = n_rna, ncol = 1))
  H_norm_1 <- cbind(H_norm_1,matrix(append(((n_rna%%m)+1):n_rna,1:(n_rna%%m)), nrow = n_rna, ncol = 1))
  
  H_norm_2 <- matrix(n_prot:1, nrow = n_prot, ncol = 1)
  H_norm_2 <- cbind(H_norm_2,matrix(1:n_prot, nrow = n_prot, ncol = 1))
  H_norm_2 <- cbind(H_norm_2,matrix(append(((n_prot%%m)+1):n_prot,1:(n_prot%%m)), nrow = n_prot, ncol = 1))
  
  rownames(H_norm_1) <- paste0("cell", 1:n_rna)
  rownames(H_norm_2) <- paste0("cell", (n_rna + 1):(n_rna + n_prot))
  
  return(list(rna = H_norm_1,
              protein = H_norm_2))
}

##' This function create the list of matrices V
##'
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param g `numeric(1)` indicating the number shared genes between 
##'     two modalities
make_V_list <- function(k, g) {
  #dim: k x g
  
  ##faire une fonction pour ca :
  values1 <- rnorm(15 * k, mean = 2, sd = 0.5)
  values1[values1 < 0] <- 0
  values2 <- rnorm(15 * k, mean = 4, sd = 1)
  values2[values2 < 0] <- 0
  V = list()
  V[[1]] <- matrix(10,   nrow = k, ncol = g)
  V[[2]] <- matrix(5,   nrow = k, ncol = g)
  return(V)
  
}

##' This function create the matrix W
##'
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param g `numeric(1)` indicating the number shared genes between 
##'     two modalities
make_W <- function(k, g) {
  ## dim: k x g
  
  W <- matrix(runif(k*g, 0,2),   nrow = k, ncol = g)
  #W <- cbind(rbind(matrix(10,nrow = 1, ncol = 10),matrix(0,nrow=1,ncol=10)),
  #           rbind(matrix(0,nrow = 1, ncol = 5),matrix(10,nrow=1,ncol=5)))
  return(W)
}

##' This function create the list of matrices U
##'
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param z_rna `numeric(1)` indicating the number of unshared genes 
##'     in the rna modality.
##'     
##' @param z_prot `numeric(1)` indicating the number of unshared genes 
##'     in the protein modality.
make_U_list <- function(k, z_rna, z_prot) {
  #dim: k x z_i
  U = list()
  
  ##faire une fonction pour ca :
  values1 <- rnorm( z_rna * k, mean = 30, sd = 1.5)
  values1[values1 < 0] <- 0
  values2 <- rnorm(z_prot * k, mean = 30, sd = 1.5)
  values2[values2 < 0] <- 0
  
  U[[1]] <- matrix(10,  nrow = k, ncol = z_rna)
  U[[2]] <- matrix(5,  nrow = k, ncol = z_prot)
  return(U)
  
  
}

##' This function create the list of matrices zero_matrix_u_partial 
##' filled with zeros
##'
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param z_rna `numeric(1)` indicating the number of unshared genes 
##'     in the rna modality.
##'     
##' @param z_prot `numeric(1)` indicating the number of unshared genes 
##'     in the protein modality.
make_zero_partial <- function(k, z_rna, z_prot) {
  #dim: k x z_i
  zero_matrix_u_partial <- c()
  zero_matrix_u_partial[[1]] <- matrix(0, nrow = k, ncol = z_rna)
  zero_matrix_u_partial[[2]] <- matrix(0, nrow = k, ncol = z_prot)
  return(zero_matrix_u_partial)
  
}

make_zero_full <- function(z_rna, z_prot, n_rna, n_prot) {
  #--------- Attention : Alors c'est bizarre n_1 + n_2 : reverif + pk on l'utilise pas?
  #dim: z_i x (n_1 + n_2)
  zero_matrix_u_full <- c()
  zero_matrix_u_full[[1]] <- matrix(0, nrow = z_rna, ncol =  n_rna + n_prot)
  zero_matrix_u_full[[2]] <- matrix(0, nrow = z_prot, ncol = n_rna +  n_prot)
  return(zero_matrix_u_full)
}

##' This function create the list of matrices X = [[E_rna|P_rna]^t,[E_prot|P_prot]^t]
##' by doing the matrix product : X[[i]] = H_i * [V_i + W | U_i + zero]
##' 
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param z_rna `numeric(1)` indicating the number of unshared genes 
##'     in the rna modality.
##'     
##' @param z_prot `numeric(1)` indicating the number of unshared genes 
##'     in the protein modality.
make_X_list <- function(W, zero_matrix_u_partial, V, U, H) {
  #dim: (g+z_i) x n_i
  X = list()
  X[[1]] <- (rbind(t(W),t(zero_matrix_u_partial[[1]])) + rbind(t(V[[1]]),t(U[[1]]))) %*% t(H[[1]])
  X[[2]] <- (rbind(t(W),t(zero_matrix_u_partial[[2]])) + rbind(t(V[[2]]),t(U[[2]]))) %*% t(H[[2]])
  return(X) 
}

