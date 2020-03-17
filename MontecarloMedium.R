### Monte Carlo Integration ###
### MOKHWA LEE ###

## MEDIUM

#install.packages('cubature')
library(cubature)
help(cubature)

# compute the integral of f(x) = exp^{-a||x||^2}
# region : cube [-1,1]^n
# various values of a and dimension n until it crashes
a <- runif(10, -10, 10)
n <- sample(1:20, 10, replace=F)
f = function(x){exp(-a*abs(x)^2)}

for (i in 1:10){
cat("a = ", a[i], "n = ", n[i], "\n")
cat("** Hcubature **\n")
print(hcubature(f, lower = (-1)^n[i], upper = 1))
cat("** Pcubature **\n")
print(pcubature(f, lower = (-1)^n[i], upper = 1))
cat("------------------------\n")
}
