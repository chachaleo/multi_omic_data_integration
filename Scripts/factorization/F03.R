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

make_V_list <- function(k, g) {
  V = list()
  V[[1]] <- matrix(runif(k*g, 10,12),   nrow = k, ncol = g)
  V[[2]] <- matrix(runif(k*g, 5,7),   nrow = k, ncol = g)
  return(V)
  
}

make_W <- function(k, g) {
  W <- matrix(runif(k*g, 0,2),   nrow = k, ncol = g)
  return(W)
}

make_U_list <- function(k, z_rna, z_prot) {
  U = list()
  U[[1]] <- matrix(runif(k*z_rna, 10,12),  nrow = k, ncol = z_rna)
  U[[2]] <- matrix(runif(k*z_prot, 5,7),  nrow = k, ncol = z_prot)
  return(U)
  
  
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
  return(X) 
}

