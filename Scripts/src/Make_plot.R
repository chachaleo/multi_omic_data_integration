##Plot

## TODO : mettre path aux images sauvegardées

##' This function plots two matrices value by value column by column
##' 
##' assert : dim(V) = dim(W)
##'
##' @param V `numeric(n * m)` first matrix to plot : RED.
##' @param W `numeric(n * m)` first matrix to plot : GREEN
##'
##' @param n `numeric(1)` number of rows of V and W  
##' @param m `numeric(1)` mumber of columns of V and W
##' 
##' @param name `string` name of the plot
##' @param nameV `string` name of the matrix V
##' @param nameW `string` name of the matrix W
##' 
plot_two_matrices_column <- function(V, W, n, m, nameV, nameW, name) {
  dim(V) <- c(1,n * m)
  dim(W) <- c(1,n * m)
  X <- rbind(V, W)
  
  png(name)
  
  barplot(X,
          main = name,
          xlab = "x",
          col = c("red","green"),
          beside=TRUE
  )
  legend("topleft",
         c(nameV, nameW),
         fill = c("red","green")
  )
  dev.off()
}


plot_one_matrices_column <- function(V, n,m,name) {
  dim(V) <- c(1,n * m)
  
  png(name)
  
  barplot(V,
          main = name,
          xlab = "x",
          col = c("red"),
          beside=TRUE
  )
  legend("topleft",
         c(name),
         fill = c("red")
  )
  dev.off()
}


make_csv <- function(A,B,name) {
  df <- data.frame(RNA = A,
                 PROT = B)
  write.csv(df,name, row.names = FALSE)



  
}



make_csv_HNORM <- function(A,name) {
  df <- data.frame(W = A)
  write.csv(df,name, row.names = FALSE)



  
}

make_csv_W <- function(A,name) {
  print("WARNING : CHANGEMENT SIGNATURE FCT MAKE CSV W")
  df <- data.frame(W = A)
  write.csv(df,name, row.names = FALSE)
  
}
