install.packages("ggplot2")
install.packages("geometry")
library(ggplot2)
library(Rcpp)
library(volesti)
library(volesti)
library(geometry)

P <- GenCube(3,'H')
print(volume(P))
help("volume")
help("sample_points")

# generate a 3-dim cross polytope in V-representation
A = GenCross(3,'V')

# sampling via random walks
for (step in c(1,20,100,150)){
  for (walk in c("CDHR", "RDHR", "BW")){
    P <- GenCube(100, 'H')
    points1 <- sample_points(P, WalkType = walk, walk_step = step, N=1000)
    g<-plot(ggplot(data.frame( x=points1[1,], y=points1[2,] )) +
              geom_point( aes(x=x, y=y, color=walk)) + coord_fixed(xlim = c(-1,1),
                                                                   ylim = c(-1,1)) + ggtitle(sprintf("walk length=%s", step, walk)))
  }
}

factor(rep(letters[1:3],each=10))
help(factor)

# volume estimation








