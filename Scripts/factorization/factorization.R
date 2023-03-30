library(MultiAssayExperiment)
library(rliger)


source("/home/charlotte/Desktop/Memoire/Scripts/F02.R")
source("/home/charlotte/Desktop/Memoire/Scripts/src/Make_plot.R")
source("/home/charlotte/Desktop/Memoire/Scripts/src/Make_liger.R")
source("/home/charlotte/Desktop/Memoire/Scripts/src/Make_reduction.R")

script <- "F01"

#n_i : number of cells
n_rna <- 40
n_prot <- 40

#g : number of shared genes
g <- 25

#z_i : number of unshared genes
z_rna <- 5
z_prot <- 5

#k : , random : rand.seed
k <- 3
random <- as.integer(args[1])


#dim(H) = (n_rna x k, n_prot x k)
H <- make_H_list(n_rna, n_prot, k)

print(H)

#dim(V) = (k x g, k x g)
V <- make_V_list(k, g)

print(V)

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
lig <- make_liger_object(X, n_rna, n_prot, g, z_rna, z_prot, k)

lig <- optimizeALS(lig,
                   k = k, ## Number of latent factors
                   lambda = 5,
                   thresh = 1e-06,
                   max.iters = 30,
                   use.unshared = TRUE,
                   rand.seed=1)

make_csv(H[[1]],H[[2]],"/home/charlotte/Desktop/Memoire/Scripts/csv/H_init.csv")
make_csv(V[[1]],V[[2]], "/home/charlotte/Desktop/Memoire/Scripts/csv/V_init.csv")
make_csv(U[[1]],U[[2]], "/home/charlotte/Desktop/Memoire/Scripts/csv/U_init.csv")
make_csv_W(W,"/home/charlotte/Desktop/Memoire/Scripts/csv/W_init.csv")

make_csv(t(X[[1]]),t(X[[2]]),"/home/charlotte/Desktop/Memoire/Scripts/csv/X.csv")
make_csv(lig@scale.data[[1]],lig@scale.data[[2]],"/home/charlotte/Desktop/Memoire/Scripts/csv/shared.csv")
make_csv(t(lig@scale.unshared.data[[1]]),t(lig@scale.unshared.data[[2]]), "/home/charlotte/Desktop/Memoire/Scripts/csv/unshared.csv")

make_csv(lig@H[[1]],lig@H[[2]],"/home/charlotte/Desktop/Memoire/Scripts/csv/H.csv")
make_csv(lig@V[[1]],lig@V[[2]], "/home/charlotte/Desktop/Memoire/Scripts/csv/V.csv")
make_csv(lig@U[[1]],lig@U[[2]], "/home/charlotte/Desktop/Memoire/Scripts/csv/U.csv")
make_csv_W(lig@W,"/home/charlotte/Desktop/Memoire/Scripts/csv/W.csv")

