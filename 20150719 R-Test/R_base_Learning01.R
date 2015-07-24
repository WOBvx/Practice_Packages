#内积计算
> a <- c(1,2,3)
> b <- c(2,2,4)
c <- crossprod(a,b)
c

#
x <- seq(from = -5, to = 5, by = 0.25)  
y <- seq(from = -2, to = 2, by = 0.1)  
f <- function(x,y){x**2+50*cos(y)}  
z <- outer(x,y,f) # outer(X, Y, FUN = "*", ...),Outer Product of Arrays
persp(x,y,z)  #用于画出 x-y 平面上的透视平面图，x,y必须是递增量

#矩阵基础
A <- matrix(1:12, nrow=4, ncol=3, bycol=T)
B <- matrix(c(1,0), nrow=3, ncol=2, byrow=T)
A %*% B