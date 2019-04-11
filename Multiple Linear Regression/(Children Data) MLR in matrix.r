sales=read.csv("//Users//phoebeyu//Documents//Academic Class//Method of Statistics//Multiple linear regression//example 1.csv")
y=sales[,3]
x1=sales[,1]
x2=sales[,2]

# Calculations in matrix format
one=rep(1,21)
x=cbind(one,x1,x2)

# take a transpose of matrix x
x.t=t(x)

# multiply two matrices
xx=x.t%*%x

# inverse of matrix t(x)*x
xx.n=solve(xx)

b.0=xx.n%*%x.t
b=b.0%*%y
b
#        [,1]
# one   -68.85707
# x1      1.45456
# x2      9.36550
