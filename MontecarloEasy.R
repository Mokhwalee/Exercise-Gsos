### Monte Carlo Integration ###
### MOKHWA LEE ###

## EASY

# compile and run volesti : install.packages("volesti")

# generate a random H-polytope and compute its volume
library(Rcpp)
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
volume(P,  WalkType = "CDHR", walk_step = 20) 
volume(P,  WalkType = "RDHR", walk_step = 20)
volume(P,  WalkType = "BW", walk_step = 20)

# exact_vol(P) : does not work

# -------------------------------------------------
## RESULT ##

# > d <- readline(prompt = "Enter The dimension of the convex polytope: \n")
# Enter The dimension of the convex polytope: 
#   5

# > f <- readline(prompt = "Enter the number of the facets: \n")
# Enter the number of the facets: 
#   15

# > # convert character into integer
#   > dimension <- as.integer(d)
# > facet <- as.integer(f)

# > # generate a d-dimensional polytope with f facets
#   > P = GenRandHpoly(dimension,facet)
# > P
# C++ object <0x7fd2bd5659f0> of class 'Hpolytope' <0x7fd2bd572590>

#   > # compute the volume of generated polytope(P)
#   > volume(P)
# [1] 17460475
# > volume(P,  WalkType = "CDHR", walk_step = 5) 
# [1] 17125822
# > volume(P,  WalkType = "RDHR", walk_step = 5)
# [1] 18702053
# > volume(P,  WalkType = "BW", walk_step = 5)
# [1] 19735982
# > volume(P,  WalkType = "CDHR", walk_step = 20) 
# [1] 18120272
# > volume(P,  WalkType = "RDHR", walk_step = 20)
# [1] 18047502
# > volume(P,  WalkType = "BW", walk_step = 20)
# [1] 17823575
# > 

