### Monte Carlo Integration ###
### MOKHWA LEE ###

## HARD

library(Rcpp)
library(cubature)
library(volesti)

num_of_points <- 10000
a1 <- runif(10, -5, 20) # constant in function f(x)
n <- sample(1:7, 10, replace=T) # dimension

for (i in 1:length(a1))
{
  a = a1[i]
  cat("dimension = ",n[i]," and", "constant a = ",a,"\n") 
  f = function(x){exp(-a*sum(x^2))}  # given function
  
  start.time <- Sys.time()
  
  cubintegral = hcubature(f, lowerLimit = rep(-1,n[i]), upperLimit = rep(1,n[i]))$integral
  #print(cubintegral)
  
  end.time <- Sys.time()
  time.taken1 <- end.time - start.time
  cat("time taken by cubature package= ", time.taken1, "sec\n")
  
  
  # generate random n-dim cube
  P = GenCube(n[i], 'H') 
  
  # simple Monte Carlo by uniform sampling (default)
  start.time <- Sys.time()
  
  points1 = sample_points(P, N=num_of_points, distribution = "uniform",
              WalkType = "RDHR", walk_step = 100)

  int1<-0
  for (j in 1:num_of_points)
    {
      int1 <- int1 + f(points1[,j])
    }
  V1 <- volume(P)
  unitintegral = int1*V1/num_of_points
  #print(unitintegral)
  
  end.time <- Sys.time()
  time.taken2 <- end.time - start.time
  cat("time taken by Uniform Dist = ", time.taken2, "sec\n")

  
  # by Importance Sampling using multivariate spherical Gaussian
  start.time <- Sys.time()
  
  points2 = sample_points(P, N = num_of_points, distribution = "gaussian",
              WalkType = "RDHR", walk_step = 100)

  int2<-0
  for (j in 1:num_of_points)
    {
      int2 <- int2 + f(points2[,j])
  }
  
  V2 <- volume(P)
  gaussianintegral = int2*V2/num_of_points
  #print(gaussianintegral)
  
  end.time <- Sys.time()
  time.taken3 <- end.time - start.time
  
  cat("time taken by Gaussian Dist = ", time.taken3, "sec\n")

  # accuracy and run-time
  cat("cubintegral = ", cubintegral , "\n","unitingetral = ",unitintegral,"\n",
      "gaussianintegral = ",gaussianintegral,"\n")
  
  cat("----------------------------------------\n\n")
}


## Comment on accuracy and run-time ##
# Overall results say that uniformly chosen sample_points approximates integral well(pretty accurate) than Gaussian/cubature method
# Using Cubature package(hcubature) takes more time than using Volesti Package
# Volesti Package with sample_point function is preferable for computation time
# With the randomly generated n-dim cube, I detect that integral with cubature package and uniform sample point in Volesti
#     yield similar results, but Gaussian sampling yields large errors.
# Large number 'n' (higher dimension) makes it difficult to compute integral
# Large absolute value 'a' yields bigger integrals


#--------------------------------------------
## RESULT ##
# dimension =  2  and constant a =  -4.03362 
# time taken by cubature package=  0.01342297 sec
# time taken by Uniform Dist =  2.618656 sec
# time taken by Gaussian Dist =  3.524476 sec
# cubintegral =  283.8445 
# unitingetral =  281.5061 
# gaussianintegral =  188.1231 
# ----------------------------------------
# dimension =  6  and constant a =  6.009342
# Out of Running Time
# ----------------------------------------
# dimension =  5  and constant a =  13.77769 
# time taken by cubature package=  35.93841 sec
# time taken by Uniform Dist =  2.838401 sec
# time taken by Gaussian Dist =  4.004739 sec
# cubintegral =  0.02482753 
# unitingetral =  0.02984953 
# gaussianintegral =  0.0564704 
# ----------------------------------------
# dimension =  6  and constant a =  13.110022
# Out of Running Time
# ----------------------------------------
# dimension =  3  and constant a =  -4.095116 
# time taken by cubature package=  0.3225322 sec
# time taken by Uniform Dist =  2.822907 sec
# time taken by Gaussian Dist =  3.922821 sec
# cubintegral =  5450.413 
# unitingetral =  5361.817 
# gaussianintegral =  2848.765 
# ----------------------------------------
