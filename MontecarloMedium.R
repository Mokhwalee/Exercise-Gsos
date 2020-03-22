### Monte Carlo Integration ###
### MOKHWA LEE ###

## MEDIUM

#install.packages('cubature')
library(cubature)
help(cubature)

# compute the integral of f(x) = exp^{-a||x||^2}
# region : cube [-1,1]^n

# various values of a and dimension n untill it crashes
a <- runif(10, 1, 100)
n <- sample(10:20, 10, replace=F)
a
n

# number of component is one, which is x
fun = function(x){exp(-a*abs(x)^2)}

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
  cat("time taken = ", time.taken)
  
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
# For the bigger number a, f(x) has the bigger constant a in the exponential function and so it could be less accurate.
# For the bigger number n, error increases because the integration is conducted in higher dimension.
# Moreover, the running time is more with bigger a and n.