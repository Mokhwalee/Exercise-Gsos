### Montecarlo Bonus Exercise ###
### MOKHWA LEE ###

f <- readline(prompt = "Enter the number of the facets: \n")
facet <- as.integer(f)

# generate a 100-dim random H-polytope
P = GenRandHpoly(100,facet)

# compute the largest inscribed ball (Chebychev ball)
Inner = InnerBall(P)
x0 = Inner[1:length(Inner)-1]
radius = Inner[length(Inner)]

# Compute the Integral over the above polytope with various a
f = function(x){exp(-a*abs(x-x0)^2)}
a <- runif(10, -5, 20)
for (i in 1:length(a))
{
  
}

# 20 times each with both uniform and Gaussian sampling and take the average


# standard deviation

  