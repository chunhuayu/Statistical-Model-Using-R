water=read.csv("//Users//phoebeyu//Documents//Academic Class//Method of Statistics//Multiple linear regression//water.csv")
View(water)
y=water[,1]
x1=water[,2]
x2=water[,3]
x3=water[,4]
x4=water[,5]
water.fit=lm(y~x1+x2+x3+x4)
anova(water.fit)
# Analysis of Variance Table

# Response: y
#           Df  Sum Sq Mean Sq F value   Pr(>F)    
# x1         1 14869.4 14869.4 26.7836 2.37e-05 ***
# x2         1   111.9   111.9  0.2016   0.6573    
# x3         1     4.2     4.2  0.0076   0.9311    
# x4         1  2475.2  2475.2  4.4584   0.0449 *  
# Residuals 25 13879.2   555.2                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# by using anova method, the dependent variables x1 and x

# check the residuals
plot(residuals(water.fit))
shapiro.test(residuals(water.fit))
#	Shapiro-Wilk normality test

# data:  residuals(water.fit)
# W = 0.91115, p-value = 0.01591

# the residuals is not normally distributed. Next, try to do transformation.
library(TSA)
BoxCox.ar(y)
list(BoxCox.ar(y))
# [[1]]$mle
#  [1] 0.1

# doing log transformation, fit the model again.
logy=log(y)
water.logfit=lm(logy~x1+x2+x3+x4)
anova(water.fit)
# Analysis of Variance Table

# Response: y
#          Df  Sum Sq Mean Sq F value   Pr(>F)    
# x1         1 14869.4 14869.4 26.7836 2.37e-05 ***
# x2         1   111.9   111.9  0.2016   0.6573    
# x3         1     4.2     4.2  0.0076   0.9311    
# x4         1  2475.2  2475.2  4.4584   0.0449 *  
# Residuals 25 13879.2   555.2                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Check the normality, It is proved that residuals follows normal distribution.
shapiro.test(residuals(water.logfit))
#	Shapiro-Wilk normality test
# data:  residuals(water.logfit)
# W = 0.95773, p-value = 0.2708

# Since the insignificant variables x2 and x3, consider a reduced model
anova(water.r2,water.logfit)
# Analysis of Variance Table

# Model 1: logy ~ x1 + x3 + x4
# Model 2: logy ~ x1 + x2 + x3 + x4
#  Res.Df    RSS Df Sum of Sq      F Pr(>F)
# 1     26 50.759                           
# 2     25 48.794  1    1.9651 1.0069 0.3253
# x2 can be dropped

water.r3=lm(logy~x1+x4)
anova(water.r3,water.r2)
# Analysis of Variance Table
# Model 1: logy ~ x1 + x4
# Model 2: logy ~ x1 + x3 + x4
#  Res.Df    RSS Df Sum of Sq      F Pr(>F)
# 1     27 51.305                           
# 2     26 50.759  1   0.54573 0.2795 0.6015
# x3 can be dropped

anova(water.r3)
# Analysis of Variance Table

# Response: logy
#          Df Sum Sq Mean Sq F value   Pr(>F)   
# x1         1 21.815 21.8153 11.4807 0.002174 **
# x4         1  0.467  0.4671  0.2458 0.624050   
# Residuals 27 51.305  1.9002                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# from the anova table of y= b0+b1x1 + b4x4 + e model, x4 is not significant for the model. 
# we conclude that the model Y= b0+b1x1 +e

water.r4=lm(logy~x1)
summary(water.r4)
# Call:
# lm(formula = logy ~ x1)

# Residuals:
#    Min      1Q  Median      3Q     Max 
# -3.2854 -0.7249  0.1746  0.8451  2.0901 

# Coefficients:
#            Estimate Std. Error t value Pr(>|t|)   
# (Intercept) 0.929794   0.356658   2.607  0.01448 * 
# x1          0.005585   0.001626   3.435  0.00187 **
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# Residual standard error: 1.36 on 28 degrees of freedom
# Multiple R-squared:  0.2965,	Adjusted R-squared:  0.2713 
# F-statistic:  11.8 on 1 and 28 DF,  p-value: 0.001867

# the model: y=0.930+0.0056x1+e
