## Generate data

make_H_list <- function(n_rna, n_prot, k){
  H <- list()
  H[[1]] <- matrix(rbeta(k*n_rna,2,2)*2,n_rna,k)
  H[[2]] <- matrix(rbeta(k*n_prot,2,2)*2,n_prot,k)

  for (i in 1:k) {
    for (j in 1:k) {
      H[[1]][i+(j-1)*k,j] = 10
      H[[2]][i+(j-1)*k,j] = 10
    }
  }
  return(H)
}

heterogenous_perturbation <- function(){
  return(sample(c(TRUE,FALSE),1, prob = c(0.5,0.5)))
}

make_V_list <- function(k,g){
  V <- list()
  V[[1]] <- matrix(runif(k*g,0,0.2), nrow = k, ncol = g)
  V[[2]] <- matrix(runif(k*g,0,0.2), nrow = k, ncol = g)
  return(V)
}



make_W <- function(k,g){
  W <- matrix(rbeta(k*g,2,2)*2,k,g)
  for (i in 1:k) {
    for (j in 1:k) {
      W[i,j+(i-1)*k] = 10
    }
  }
  return(W)
}



make_U_list <- function(k, z_rna, z_prot) {
  U = list()

  U[[1]] <- matrix(runif(k*z_rna,0,0.2), nrow = k, ncol = z_rna)
  U[[2]] <- matrix(runif(k*z_prot,0,0.2), nrow = k, ncol = z_prot) 
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
  X <- add_error(X)
  return(X) 
}



add_error <- function(X) {
  for (mod in 1:2) {
    for (i in 1:dim(X[[mod]])[1]) {
      for (j in 1:dim(X[[mod]])[2]) {
        X[[mod]][i,j] = scattered_error(X[[mod]][i,j])
        X[[mod]][i,j] = abs(X[[mod]][i,j] + unif_error())
      }
    }
  }
  return(X)
}

scattered_error <- function(x) {
  sigma = 0.1
  if(sample(c(TRUE,FALSE),1, prob = c(sigma,(1-sigma)))){
    if(x==0){return((rbeta(1,2,2)*2)^2)}
    else{return(0)}
  }
  return(x)
}

unif_error <- function() {
  sigma = 0.1
  if(sample(c(TRUE,FALSE),1, prob = c(sigma,(1-sigma)))){return(runif(1,-sigma,sigma))}
  return(0)
}

