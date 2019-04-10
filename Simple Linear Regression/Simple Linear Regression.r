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

qqnorm(residuals(SLR.fit))
qqline(residuals(SLR.fit))

# Test normality
shapiro.test(residuals(SLR.fit))

# output:
# Shapiro-Wilk normality test

# data:  residuals(SLR.fit)
# W = 0.9789, p-value = 0.8626


plot(Y~X, pch=19,cex=1, main="Data on Lot Size and Work Hours")
lines(X,fitted.values(SLR.fit),lwd=2,col=2)
confint(SLR.fit)

# The regression equation is Y = 62.4 + 3.57 X
# Se(b0)= 26.177, Se(b1)=0.347
# Hypotheses for b0: H0: b0=0;
# t(b0)=2.382, P-value=0.0259 which means the intercept is significant for this model.
# Hypotheses for b1: H0: b1=0;
# t(b1)=10.290, P-value=4.45e-10 which means predictor variable X and response Y has a significant linear relationship.
