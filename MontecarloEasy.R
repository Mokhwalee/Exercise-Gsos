### Monte Carlo Integration ###
### MOKHWA LEE ###

## EASY

# compile and run volesti : install.packages("volesti")

# generate a random H-polytope and compute its volume
library(volesti)
d <- readline(prompt = "Enter The dimension of the convex polytope: \n")
f <- readline(prompt = "Enter the number of the facets: \n")

# convert character into integer
dimension <- as.integer(d)
facet <- as.integer(f)

# generate a d-dimensional polytope with f facets
P = GenRandHpoly(dimension,facet)
P

# compute the volume of generated polytope(P)
volume(P)
volume(P,  WalkType = "CDHR", walk_step = 5) 
volume(P,  WalkType = "RDHR", walk_step = 5)
volume(P,  WalkType = "BW", walk_step = 5)
volume(P,  WalkType = "CDHR", walk_step = 100) 
volume(P,  WalkType = "RDHR", walk_step = 100)
volume(P,  WalkType = "BW", walk_step = 100)

# exact_vol(P) : does not work