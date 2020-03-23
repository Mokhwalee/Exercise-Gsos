### Monte Carlo Integration ###
### MOKHWA LEE ###

## MEDIUM

#install.packages('cubature')
library(cubature)

# compute the integral of f(x) = exp^{-a||x||^2}
# region : cube [-1,1]^n

# various values of a and dimension n untill it crashes
a1 <- runif(10, -10, 30)
n <- sample(1:3, 10, replace=T)

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

