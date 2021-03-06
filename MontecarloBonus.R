### Montecarlo Bonus Exercise ###
### MOKHWA LEE ###

## BONUS ##

library(Rcpp)
library(cubature)
library(volesti)

#ff <- readline(prompt = "Enter the number of the facets: \n")
ff = 500
#ffacet <- as.integer(ff)

# generate a 100-dim random H-polytope
P = GenRandHpoly(100,ff)
V <- volume(P)

# compute the largest inscribed ball (Chebychev ball)
Inner = InnerBall(P)
x0 = Inner[1:length(Inner)-1]
radius = Inner[length(Inner)]

# Compute the Integral over the above polytope with various a
a1 <- runif(10, 0, 2)
num_of_points <- 10000

# Integrate over the polytope with various a
int1<-0
int2<-0
for (j in 1:length(a1))
{
  a = a1[j]
  f = function(x){exp(-a*sum((x-x0)^2))}
  
  cat("Case",j,")","constant a = ",a,"\n") 
  
  uniformintegral = rep(0,20) #initialize
  gaussianintegral = rep(0,20)
  
  # 20 times each with both uniform and Gaussian sampling and take the average. 
  # Report the standard deviation for each experiment.
  for (k in 1:20)
  {
    # Uniform Sampling
    points1 = sample_points(P = P, N=num_of_points, distribution = "uniform",
                            WalkType = "RDHR") # , walk_step = 100)
    
    # Gaussian Sampling
    points2 = sample_points(P = P, N = num_of_points, distribution = "gaussian",
                            WalkType = "RDHR") # , walk_step = 100)
    
    for (i in 1:num_of_points)
    {
      int1 <- int1 + f(points1[,i])
      int2 <- int2 + f(points2[,i])
    }
    
    uniformintegral[k] = int1*V/num_of_points
    cat("Uniform sampling = ", uniformintegral[k],"\n")
    
    gaussianintegral[k] = int2*V/num_of_points
    cat("Gaussian sampling = ", gaussianintegral[k], "\n")
    
  }
  average1 <- mean(uniformintegral) # average for uniform dist
  average2 <- mean(gaussianintegral) # average for gaussian dist
  cat("Average(uniform) = ",average1,"\n","Average(gaussian) = ",average2,"\n")
  
  
  sd1 <- sd(uniformintegral)
  sd2 <- sd(gaussianintegral)
  cat("Standard Deviation(uniform) = ",sd1,"\n",
      "Standard Deviation(gaussian) = ",sd2,"\n")
  
  cat("—————————————————————")
  
}

## Comments ##
# The package needs to be improved to deal with high dimensional polytope to get integral

## RESULT ##
# While calculating Volume(P), computer is out of running time
# In fourth and fifth line, I made 100-dimensional random H-polytope 
#and tried to calculate the volume V with around 500-600 facets, 
#but because of the high-dimensional property, 
#the computer is out of running time calculating it