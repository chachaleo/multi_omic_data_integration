##Generate data

##Basic moddelisation (des patates) 


##' This function create the list of matrices X = [[E_rna|P_rna]^t,[E_prot|P_prot]^t]
##' by doing the matrix product : X[[i]] = H_i * [V_i + W | U_i + zero]
##' 
##' @param k `numeric(1)` number of latent factors.
##' 
##' @param n_rna `numeric(1)` indicating the number of unshared genes 
##'     in the rna modality : EVEN number (TODO : make it ok for odd number)
##'     
##' @param n_prot `numeric(1)` indicating the number of unshared genes 
##'     in the protein modality : EVEN number (TODO : make it ok for odd number)
##'     
##'     pattern : X[[1]] = [10 | 1 ]
##'               X[[2]] = [1  | 10] 
##'     
make_X_list_00 <- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()#dim: (g+z_rna) x n_rna)
  X[[1]] <- cbind(matrix(10,nrow = g + z_rna, ncol = (n_rna)/2),
                  matrix(1,nrow = g + z_rna, ncol = (n_rna)/2)) 
  #dim: (g+z_prot) x n_prot)
  X[[2]] <- cbind(matrix(10,nrow = g + z_prot, ncol = (n_prot)/2),
                  matrix(1,nrow = g + z_prot, ncol = (n_prot)/2)) 
  return(X) 
}

#moitier-moitier dans les deux sens : pas interressant :  ne depend pas de shared/unshared
#BUG
##' Pattern : X[[1]] [10 | 5 ]
##'                  [5  | 10]
##'                  
##'           X[[2]] [5  | 10]
##'                  [10 | 5 ] 
make_X_list_01 <- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()#dim: (g+z_rna) x n_rna)
  X[[1]] <- cbind(rbind(matrix(5,nrow = (g + z_rna)/2, ncol = (n_rna)/2),matrix(10,nrow=(g + z_rna)/2,ncol=(n_rna)/2)),
                  rbind(matrix(10,nrow = (g + z_rna)/2, ncol = (n_rna)/2),matrix(5,nrow=(g + z_rna)/2,ncol=(n_rna)/2)))
  #dim: (g+z_prot) x n_prot)
  X[[2]] <- cbind(rbind(matrix(10,nrow = (g + z_prot)/2, ncol = (n_prot)/2),matrix(5,nrow=(g + z_prot)/2,ncol=(n_prot)/2)),
                  rbind(matrix(5,nrow = (g + z_prot)/2, ncol = (n_prot)/2),matrix(10,nrow=(g + z_prot)/2,ncol=(n_prot)/2)))
  
  return(X) 
}


#moitier-moitier dans les deux sens : pas interressant :  ne depend pas de shared/unshared
#BUG
##' Pattern : X[[1]] [10 | 5 ]
##'                  [5  | 10]
##'                  
##'           X[[2]] [10 | 5 ]
##'                  [5  | 10]
make_X_list_02<- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()#dim: (g+z_rna) x n_rna)
  X[[1]] <- cbind(rbind(matrix(10,nrow = (g + z_rna)/2, ncol = (n_rna)/2),matrix(5,nrow=(g + z_rna)/2,ncol=(n_rna)/2)),
                  rbind(matrix(5,nrow = (g + z_rna)/2, ncol = (n_rna)/2),matrix(10,nrow=(g + z_rna)/2,ncol=(n_rna)/2)))
  #dim: (g+z_prot) x n_prot)
  X[[2]] <- cbind(rbind(matrix(10,nrow = (g + z_prot)/2, ncol = (n_prot)/2),matrix(5,nrow=(g + z_prot)/2,ncol=(n_prot)/2)),
                  rbind(matrix(5,nrow = (g + z_prot)/2, ncol = (n_prot)/2),matrix(10,nrow=(g + z_prot)/2,ncol=(n_prot)/2)))
  
  return(X) 
}

##' Pattern : X[[1]] [10 | 5 ]
##'                  [5  | 10]
##'                  
##'           X[[2]] [5  | 10]
##'                  [10 | 5 ]

make_X_list_03 <- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()#dim: (g+z_rna) x n_rna)
  X[[1]] <- t(rbind(cbind(matrix(10, nrow = (n_rna)/2,ncol = z_rna),matrix(5,nrow=(n_rna)/2,ncol=g)),
                  cbind(matrix(5, nrow = (n_rna)/2,ncol = z_rna),matrix(10,nrow=(n_rna)/2,ncol=g))))
  #dim: (g+z_prot) x n_prot)
  X[[2]] <- t(rbind(cbind(matrix(10, nrow = (n_prot)/2,ncol = g),matrix(5,nrow=(n_prot)/2,ncol=z_prot)),
                  cbind(matrix(5, nrow = (n_prot)/2,ncol = g),matrix(10,nrow=(n_prot)/2,ncol=z_prot))))

  return(X) 
}

##' Pattern : X[[1]]: [E_rna] = [   1   ]
##'                   [P_rna]   [10 | 0 ]
##'                   
##'           X[[2]]: [E_prot] = [   1   ]
##'                   [P_prot]   [ 0 | 10]
##'                   
make_X_list_04 <- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()#dim: (g+z_rna) x n_rna)
  X[[1]] <- cbind(rbind(matrix(5,nrow = g, ncol = (n_rna)/2),matrix(100,nrow=z_rna,ncol=(n_rna)/2)),
                  rbind(matrix(5,nrow = g, ncol = (n_rna)/2),matrix(1,nrow=z_rna,ncol=(n_rna)/2)))
  #dim: (g+z_prot) x n_prot)
  X[[2]] <- cbind(rbind(matrix(5,nrow = g, ncol = (n_prot)/2),matrix(1,nrow=z_prot,ncol=(n_prot)/2)),
                  rbind(matrix(5,nrow = g, ncol = (n_prot)/2),matrix(100,nrow=z_prot,ncol=(n_prot)/2)))
  
  return(X) 
}






make_X_list_05 <- function(g, z_rna, z_prot, n_rna, n_prot) {
  #dim: (g+z_i) x n_i)
  X = list()
  X[[1]] <- matrix(1, nrow = 1,ncol = n_rna)
  X[[2]] <- matrix(1, nrow = 1,ncol = n_prot)

  for (i in 2:(z_rna + g)) { 
    X[[1]] <- rbind(X[[1]], matrix(i, nrow = 1,ncol = n_rna))
  }

  for (i in 2:(z_prot + g)) { 
    X[[2]] <- rbind(X[[2]], matrix(i, nrow = 1,ncol = n_prot))
  }

  return(X) 
}