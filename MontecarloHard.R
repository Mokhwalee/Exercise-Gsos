### Monte Carlo Integration ###
### MOKHWA LEE ###

## HARD

# simple Monte Carlo by uniform sampling

f = function(x){exp(-a*abs(x)^2)}

points1 = sample_points(P = NULL, N = NULL, distribution = uniform,
              WalkType = NULL, walk_step = NULL, exact = NULL, body = NULL,
              Parameters = NULL, InnerPoint = NULL)


# by Importance Sampling using multivariate spherical Gaussian
points2 = sample_points(P = NULL, N = NULL, distribution = gaussian,
              WalkType = NULL, walk_step = NULL, exact = NULL, body = NULL,
              Parameters = NULL, InnerPoint = NULL)


# Comment on the accuracy and run-time