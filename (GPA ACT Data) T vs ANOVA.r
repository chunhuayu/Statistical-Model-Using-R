Grade=read.csv("//Users//phoebeyu//Documents//Academic Class//Method of Statistics//Simple linear regression//T ANOVA.csv")
GPA=Grade[,1]
ACT=Grade[,2]

# fit simple linear regression model by using t test
Grade.fit=lm(GPA~ACT)
summary(Grade.fit)

# Call:
# lm(formula = GPA ~ ACT)

# Residuals:
#     Min       1Q   Median       3Q      Max 
# -2.74004 -0.33827  0.04062  0.44064  1.22737 

# Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  2.11405    0.32089   6.588  1.3e-09 ***
# ACT          0.03883    0.01277   3.040  0.00292 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 0.6231 on 118 degrees of freedom
# Multiple R-squared:  0.07262,	Adjusted R-squared:  0.06476 (Coefficient of Determination)
# F-statistic:  9.24 on 1 and 118 DF,  p-value: 0.002917


# Obtain a 99% confidence interval for parameters, they don't contain zero, we conclude they are significant.
confint(Grade.fit,level = 0.99)
#               0.5 %     99.5 %
# (Intercept) 1.273902675 2.95419590
# ACT         0.005385614 0.07226864

# Obtain a 95% percent interval estimate of the mean freshman GPA for students whose ACT test score is 28.
predict.ci=predict(Grade.fit,interval = 'confidence',Grade.fit=T,data.frame(ACT=28,type = 'response'))
predict.ci
#       fit      lwr      upr
#  3.201209 3.061384 3.341033

# Mary Jones obtained a score of 28 on the entrance test. Predict her freshman GPA using a 95% prediction interval.
predict.pi=predict(Grade.fit,interval = 'prediction',Grade.fit=T,data.frame(ACT=28,type = 'response'))
predict.pi
#       fit      lwr      upr
#  3.201209 1.959355 4.443063

# Prediction interval for a new response is wider then the confidence interval of the mean, 

# Set up the ANOVA table, when X is introduced into the regression model, SSR=3.5878.
anova(Grade.fit)
# Analysis of Variance Table
# Response: GPA
#           Df Sum Sq Mean Sq F value   Pr(>F)   
# ACT         1  3.588  3.5878  9.2402 0.002917 **
# Residuals 118 45.818  0.3883                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
