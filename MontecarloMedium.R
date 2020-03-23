### Monte Carlo Integration ###
### MOKHWA LEE ###

## MEDIUM

#install.packages('cubature')
library(cubature)

# compute the integral of f(x) = exp^{-a||x||^2}
# region : cube [-1,1]^n

# various values of a and dimension n untill it crashes
a1 <- runif(10, -10, 30)
n <- sample(1:10, 10, replace=T)

for (i in 1:length(a1))
{
  cat("a = ", a1[i], "n = ", n[i], "\n")
  a = a1[i]
  # number of component is one, which is x
  fun = function(x){exp(-a*sum(x^2))}
  
  start.time <- Sys.time()
  
  # integral = cubintegrate(f=fun, lower=rep(-1,n[i]), upper=rep(1,n[i]))
  integral = hcubature(f = fun, lowerLimit = rep(-1,n[i]), upperLimit =rep(1,n[i]))
  #integral = pcubature(f=fun, lower=rep(-1,n[i]), upper=rep(1,n[i]))
  print(integral)
  
  if (integral$error > 5e-02)
  {
    cat("The error is more than 0.05\n")
  }
  
  end.time <- Sys.time()
  
  time.taken <- end.time - start.time
  cat("time taken = ", time.taken, "sec\n")
  
  if (time.taken > 60)
  {
    cat("Running time is more than 1 min\n")
  }
  
  cat("------------------------\n\n")
}

# Comments
# With the bigger number a, f(x) has the bigger constant a in the exponential function and so integral could be less accurate.
# With the bigger number n, error increases because the integration is conducted in higher dimension.
# Moreover, the running time takes more with bigger a and n.
# With negative number a, the integral and error of f(x) yields a big number 
# since it is an exponential function

# -------------------------------------------------------------------
## RESULT ##

# a =  -5.338035 n =  4 
# $integral
# [1] 3954464
# 
# $error
# [1] 39.54329
# 
# $functionEvaluations
# [1] 1887327
# 
# $returnCode
# [1] 0
# 
# The error is more than 0.05
# time taken =  3.46852 sec
# ------------------------
#   
#   a =  14.74 n =  2 
# $integral
# [1] 0.2131338
# 
# $error
# [1] 2.116202e-06
# 
# $functionEvaluations
# [1] 3587
# 
# $returnCode
# [1] 0
# 
# time taken =  0.007120848 sec
# ------------------------
#   
#   a =  18.14947 n =  4 
# $integral
# [1] 0.02996189
# 
# $error
# [1] 2.996129e-07
# 
# $functionEvaluations
# [1] 1664001
# 
# $returnCode
# [1] 0
# 
# time taken =  2.971678 sec
# ------------------------
#   
#   a =  -0.5622459 n =  5 
# $integral
# [1] 87.83049
# 
# $error
# [1] 0.0008778081
# 
# $functionEvaluations
# [1] 176049
# 
# $returnCode
# [1] 0
# 
# time taken =  0.3337209 sec
# ------------------------
#   
#   a =  -3.90702 n =  1 
# $integral
# [1] 15.41389
# 
# $error
# [1] 2.390773e-05
# 
# $functionEvaluations
# [1] 45
# 
# $returnCode
# [1] 0
# 
# time taken =  0.0001959801 sec
# ------------------------
#   
#   a =  21.51968 n =  1 
# $integral
# [1] 0.3820824
# 
# $error
# [1] 4.182931e-08
# 
# $functionEvaluations
# [1] 105
# 
# $returnCode
# [1] 0
# 
# time taken =  0.0002989769 sec
# ------------------------
#   
#   a =  28.5489 n =  2 
# $integral
# [1] 0.1100425
# 
# $error
# [1] 1.065477e-06
# 
# $functionEvaluations
# [1] 4063
# 
# $returnCode
# [1] 0
# 
# time taken =  0.007356882 sec
# ------------------------
#   
#   a =  28.62196 n =  4 
# $integral
# [1] 0.01204761
# 
# $error
# [1] 1.204459e-07
# 
# $functionEvaluations
# [1] 1184745
# 
# $returnCode
# [1] 0
# 
# time taken =  2.138492 sec
# ------------------------
#   
#   a =  26.35324 n =  7 
#   Out of Running Time

