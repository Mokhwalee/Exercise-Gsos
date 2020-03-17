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

# volume estimation / The volume of the 3-dimensional cube
library(geometry)
PV<-GenCube(3,'V')
str(PV)
help(str)
geom_values <- convhulln(PV$V, options = 'FA')
vol_approx <- volume(PV)
cat(sprintf("exact vol = %f\napprx vol = %f\nrelative error = %f\n",
            geom_values$vol, vol_approx, abs(geom_values$vol-vol_approx)/geom_values$vol))

# higher dimensional example/ error parameter --> approximation of the algorithm.
PH = GenCube(10,'H')
volumes <- list()
for (i in 1:10) {
  volumes[[i]] <- volume(PH, error=1) # default parameters
}
options(digits=10)
summary(as.numeric(volumes))
volumes <- list()
for (i in 1:10) {
  volumes[[i]] <- volume(PH, error=0.5)
}
summary(as.numeric(volumes))


