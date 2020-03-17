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
f = function(x){exp(-a*abs(x-x0)^2)}
a <- runif(10, -5, 20)
num_of_points <- 10000

# Uniform Sampling
points1 = sample_points(P = P, N=num_of_points, distribution = "uniform",
                        WalkType = "RDHR", walk_step = 100, exact = NULL, body = NULL,
                        Parameters = NULL, InnerPoint = NULL)

# Gaussian Sampling
points2 = sample_points(P = P, N = num_of_points, distribution = "gaussian",
                        WalkType = "RDHR", walk_step = 100, exact = NULL, body = NULL,
                        Parameters = NULL, InnerPoint = NULL)

# Integrate over the polytope with various a
int1<-0
int2<-0
for (j in 1:length(a))
{
  for (i in 1:num_of_points)
  {
    int1 <- int1 + f(points1[,i])
    int2 <- int2 + f(points2[,i])
    V <- volume(P)
    
    # Uniform Sampling
    print(int1*V/num_of_points)
    
    # Gaussian sampling
    print(int2*V/num_of_points)
    
    # Average
    print((int2*V/num_of_points+int2*V/num_of_points)/2)
    
    # Standard deviation
    sd()
  }
}
  