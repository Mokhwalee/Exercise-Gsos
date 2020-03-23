### Montecarlo Bonus Exercise ###
### MOKHWA LEE ###

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

# Uniform Sampling
points1 = sample_points(P = P, N=num_of_points, distribution = "uniform",
                        WalkType = "RDHR", walk_step = 100)

# Gaussian Sampling
points2 = sample_points(P = P, N = num_of_points, distribution = "gaussian",
                        WalkType = "RDHR", walk_step = 100)

# Integrate over the polytope with various a
int1<-0
int2<-0
for (j in 1:length(a1))
{
  a = a1[j]
  f = function(x){exp(-a*sum((x-x0)^2))}
  
  for (i in 1:num_of_points)
  {
    int1 <- int1 + f(points1[,i])
    int2 <- int2 + f(points2[,i])
  }
    V <- volume(P)
    
    Uniformintegral = int1*V/num_of_points
    cat("Uniform sampling = ", Uniformintegral,"\n")
    
    Gaussianintegral = int2*V/num_of_points
    cat("Gaussian sampling", Gaussianintegral, "\n")
    
    cat("Average")
    print((int2*V/num_of_points+int2*V/num_of_points)/2)
    
    cat("Standard deviation")
    
}
  