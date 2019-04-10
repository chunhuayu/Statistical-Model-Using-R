SLR=read.csv("//Users//phoebeyu//Documents//Academic Class//Method of Statistics//simple linear regression.csv")
X=SLR[,1]
Y=SLR[,2]
# fit the simple linear regression model
SLR.fit=lm(Y~X)
summary(SLR.fit)
#Call:
#lm(formula = Y ~ X)

#Residuals:
#    Min      1Q  Median      3Q     Max 
-83.876 -34.088  -5.982  38.826 103.528 

# Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   62.366     26.177   2.382   0.0259 *  
# X              3.570      0.347  10.290 4.45e-10 ***
---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 48.82 on 23 degrees of freedom
# Multiple R-squared:  0.8215,	Adjusted R-squared:  0.8138 
# F-statistic: 105.9 on 1 and 23 DF,  p-value: 4.449e-10

# The regression equation is Y = 62.4 + 3.57 X
