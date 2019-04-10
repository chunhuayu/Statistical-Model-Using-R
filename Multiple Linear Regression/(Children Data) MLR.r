# D waine Studios, Inc., operates portrait studios in 21 cities of medium size. There studios specialize in portraits 
# of children, the company is considering an expansion into other cities of medium size and wishes to investigate whether 
# sales Y in a community can be predicted from the number of persons aged 16 or younger in the community X1 and the per 
# captia disposable personal income in the community X2.

sales=read.csv("//Users//phoebeyu//Documents//Academic Class//Method of Statistics//Multiple linear regression//example 1.csv")
y=sales[,3]
x1=sales[,1]
x2=sales[,2]

# multiple linear regression model: Y=b0+b1*X1+b2*X2+e
sales.ml=lm(y~x1+x2)

# anova test
anova(sales.ml)

# by t test, estimate the parameters: b0= -68.8571  b1= 1.4546.  b2=9.3655
summary(sales.ml)
# Call:
# lm(formula = y ~ x1 + x2)

# Residuals:
#     Min       1Q   Median       3Q      Max 
# -18.4239  -6.2161   0.7449   9.4356  20.2151 

# Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -68.8571    60.0170  -1.147   0.2663    
# x1            1.4546     0.2118   6.868    2e-06 ***
# x2            9.3655     4.0640   2.305   0.0333 *  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 11.01 on 18 degrees of freedom
# Multiple R-squared:  0.9167,	Adjusted R-squared:  0.9075 
# F-statistic:  99.1 on 2 and 18 DF,  p-value: 1.921e-10

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


