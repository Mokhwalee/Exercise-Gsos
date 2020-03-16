# Rounding
P = GenSkinnyCube(2)
points1 = sample_points(P, WalkType = "CDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), 
       aes(x=x, y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed(ylim = c(-10,10))

P = GenSkinnyCube(10)
points1 = sample_points(P, WalkType = "CDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), aes(x=x,
                                                               y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed(xlim =
                                                                                                                         c(-100,100), ylim = c(-10,10))
points1 = sample_points(P, WalkType = "RDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), aes(x=x,
                                                               y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed(xlim =
                                                                                                                         c(-100,100), ylim = c(-10,10))
P = GenSkinnyCube(100)
points1 = sample_points(P, WalkType = "RDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), aes(x=x,
                                                               y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed(xlim =
                                                                                                                         c(-100,100), ylim = c(-10,10))
d <- 10

P = GenSkinnyCube(d)
points1 = sample_points(P, WalkType = "CDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), aes(x=x,
                                                               y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed(ylim =
                                                                                                                         c(-10,10))
P <- rand_rotate(P)$P
points1 = sample_points(P, WalkType = "RDHR", N=1000)
ggplot(data.frame(x = c(points1[1,]), y = c(points1[2,])), aes(x=x, y=y)) + geom_point() +labs(x =" ", y = " ")+coord_fixed()



