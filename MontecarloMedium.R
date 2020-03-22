### Monte Carlo Integration ###
### MOKHWA LEE ###

## MEDIUM

#install.packages('cubature')
library(cubature)
help(cubature)

# compute the integral of f(x) = exp^{-a||x||^2}
# region : cube [-1,1]^n

# various values of a and dimension n untill it crashes
a <- runif(10, 1, 50)
n <- sample(10:20, 10, replace=F)
a
n

# number of component is one, which is x
fun = function(x){exp(-a*sum(x)^2)}

for (i in 1:length(a))
{
  start.time <- Sys.time()
  
  cat("a = ", a[i], "n = ", n[i], "\n")
  integral = cubintegrate(f=fun, lower=rep(-1,n[i]), upper=rep(1,n[i]), fDim=1)
  print(integral)
  
  if (integral$error > 1)
  {
    cat("The result is not accurate\n")
  }
  
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  cat("time taken = ", time.taken, "sec")
  
  if (time.taken > 60)
  {
    cat("Running time is more than 1 min\n")
  }
  
  #cat("** Hcubature **\n")
  #print(hcubature(f, lower = (-1)^n[i], upper = 1))
  #cat("** Pcubature **\n")
  #print(pcubature(f, lower = (-1)^n[i], upper = 1))
  cat("------------------------\n")
}

# Comments
# With the bigger number a, f(x) has the bigger constant a in the exponential function and so integral could be less accurate.
# With the bigger number n, error increases because the integration is conducted in higher dimension.
# Moreover, the running time takes more with bigger a and n.

# -------------------------------------------------------------------
## RESULT ##
# > a
# [1] 11.719823753  5.823074621 19.438259094 29.996329820 27.331134634 45.696567947
# [7] 40.348284897  7.487748644 41.045755330 44.683249518
# > n
# [1] 15 18 19 13 20 16 14 10 11 12
# 
# a =  11.71982375 n =  15
# $integral
# [1] 8482.693501
# 
# $error
# [1] 0.04335610616
# 
# $neval
# [1] 498735
# 
# $returnCode
# [1] 0
# 
# time taken =  16.3447988 sec------------------------
#   a =  5.823074621 n =  18
# $integral
# [1] 67908.95366
# 
# $error
# [1] 870.1289973
# 
# $neval
# [1] 1314145
# 
# $returnCode
# [1] 0
# 
# The result is not accurate
# time taken =  43.49312997 sec------------------------
#   a =  19.43825909 n =  19
# $integral
# [1] 135914.7403
# 
# $error
# [1] 3248.891098
# 
# $neval
# [1] 1575147
# 
# $returnCode
# [1] 0
# 
# The result is not accurate
# time taken =  52.78390908 sec------------------------
#   a =  29.99632982 n =  13
# $integral
# [1] 2120.673375
# 
# $error
# [1] 0.01083902659
# 
# $neval
# [1] 128355
# 
# $returnCode
# [1] 0
# 
# time taken =  4.3611691 sec------------------------
#   a =  27.33113463 n =  20
# $integral
# [1] 289474.0901
# 
# $error
# [1] 301142.2514
# 
# $neval
# [1] 1049417
# 
# $returnCode
# [1] 0
# 
# The result is not accurate
# time taken =  2.72329092 sec------------------------
#   a =  45.69656795 n =  16
# $integral
# [1] 16965.387
# 
# $error
# [1] 0.08671221085
# 
# $neval
# [1] 991215
# 
# $returnCode
# [1] 0
# 
# time taken =  32.534657 sec------------------------
#   a =  40.3482849 n =  14
# $integral
# [1] 4241.346751
# 
# $error
# [1] 0.02167805314
# 
# $neval
# [1] 252075
# 
# $returnCode
# [1] 0
# 
# time taken =  8.528297901 sec------------------------
#   a =  7.487748644 n =  10
# $integral
# [1] 265.0841719
# 
# $error
# [1] 0.001354878336
# 
# $neval
# [1] 18675
# 
# $returnCode
# [1] 0
# 
# time taken =  0.04570698738 sec------------------------
#   a =  41.04575533 n =  11
# $integral
# [1] 530.1683438
# 
# $error
# [1] 0.002709756665
# 
# $neval
# [1] 34695
# 
# $returnCode
# [1] 0
# 
# time taken =  1.147085905 sec------------------------
#   a =  44.68324952 n =  12
# $integral
# [1] 1060.336688
# 
# $error
# [1] 0.005419513325
# 
# $neval
# [1] 66135
# 
# $returnCode
# [1] 0
# 
# time taken =  2.194680929 sec------------------------
