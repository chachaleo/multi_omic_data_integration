
library(rliger)

args = commandArgs(trailingOnly=TRUE)
script <- toString(args[1])

source(paste(script,".R", sep=""))
source("../src/Make_plot.R")
source("../src/Make_liger_2.R")
source("../src/Make_reduction.R")

######################################
##########  PARAMETERS
######################################

scaling <- FALSE

n_rna <- 20
n_prot <-20
g <- 16
z_rna <- 5
z_prot <- 5
k <- 4
random <- 1
random <- 1

######################################


#dim(H) = (n_rna x k, n_prot x k)
H <- make_H_list(n_rna, n_prot, k)


#dim(V) = (k x g, k x g)
V <- make_V_list(k, g)


#dim(W) = k x g
W <- make_W(k, g)

#dim(U) = (k x z_rna, k x z_prot)
U <- make_U_list(k, z_rna, z_prot)

#dim(zero_partial) = (k x z_rna, k x z_prot)
zero_matrix_u_partial <- make_zero_partial(k, z_rna, z_prot)

#TRANSPOSE
#dim: ((g+z_rna) x n_rna, (g+z_prot) x n_prot)
X <- make_X_list(W, zero_matrix_u_partial, V, U, H)



#Create lig object + normalise +  scaleNotCenter
if(scaling){
    lig <- make_liger_objec(X, n_rna, n_prot, g, z_rna, z_prot, k)
}else{
    lig <- make_liger_object_not_scaled(X, n_rna, n_prot, g, z_rna, z_prot, k)
}
lig <- optimizeALS(lig,
                   k = k, ## Number of latent factors
                   lambda = 5,
                   thresh = 1e-06,
                   max.iters = 30,
                   use.unshared = TRUE,
                   rand.seed=1)

make_csv(H[[1]],H[[2]],"../csv/H_init.csv")
make_csv(V[[1]],V[[2]], "../csv/V_init.csv")
make_csv(U[[1]],U[[2]], "../csv/U_init.csv")
make_csv_W(W,"../csv/W_init.csv")

make_csv(t(X[[1]]),t(X[[2]]),"../csv/X.csv")
make_csv(lig@scale.data[[1]],lig@scale.data[[2]],"../csv/shared.csv")
make_csv(t(lig@scale.unshared.data[[1]]),t(lig@scale.unshared.data[[2]]), "../csv/unshared.csv")

make_csv(lig@H[[1]],lig@H[[2]],"../csv/H.csv")
make_csv(lig@V[[1]],lig@V[[2]], "../csv/V.csv")
make_csv(lig@U[[1]],lig@U[[2]], "../csv/U.csv")
make_csv_W(lig@W,"../csv/W.csv")

