### Montecarlo Bonus Exercise ###
### MOKHWA LEE ###

## BONUS ##

library(Rcpp)
library(cubature)
library(volesti)

ff <- readline(prompt = "Enter the number of the facets: \n")
ffacet <- as.integer(ff)

# generate a 100-dim random H-polytope
P = GenRandHpoly(100,ffacet)

# compute the largest inscribed ball (Chebychev ball)
Inner = InnerBall(P)
x0 = Inner[1:length(Inner)-1]
radius = Inner[length(Inner)]

# Compute the Integral over the above polytope with various a
a1 <- runif(10, -5, 20)
num_of_points <- 1000

# Integrate over the polytope with various a
int1<-0
int2<-0
for (j in 1:length(a1))
{
  a = a1[j]
  f = function(x){exp(-a*sum((x-x0)^2))}
  V <- volume(P)
  
  cat("Case",j,")","constant a = ",a,"\n") 
  
  sum1<-0
  sum2<-0
  
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
    cat("Uniform sampling = ", Uniformintegral,"\n")
    
    gaussianintegral[k] = int2*V/num_of_points
    cat("Gaussian sampling", Gaussianintegral, "\n")
    
    sum1 <- sum1 + uniformintegral[k]
    sum2 <- sum2 + gaussianintegral[k]
    
  }
  sum1 <- sum1/20 # average for uniform dist
  sum2 <- sum2/20 # average for gaussian dist
  cat("Average(uniform) = ",sum1,"\n","Average(gaussian) = ",sum2,"\n")
  
  
  sd1<-0 
  sd2<-0
  for (k in 1:20)
  {
    sd1<-sd1+(uniformintegral[k]-sum1)^2
    sd2<-sd2+(gaussianintegral[k]-sum2)^2
  }
  sd1<-sqrt(sd1/20)
  sd2<-sqrt(sd2/20)
  cat("Standard Deviation(uniform) = ",sd1,"\n",
      "Standard Deviation(gaussian) = ",sd2,"\n")
  
  cat("—————————————————————")
  
}


## Comments ##


## RESULT ##