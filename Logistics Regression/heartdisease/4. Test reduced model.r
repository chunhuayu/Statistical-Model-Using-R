# fit to a reduced model, keep the variables sex, cp, trestbps, slope, ca, thal
> logistic.r=glm(hd~sex + cp+ trestbps + thalach +slope+ca+ thal,data = data, family = 'binomial')
> summary(logistic.r)

# Call:
# glm(formula = hd ~ sex + cp + trestbps + thalach + slope + ca + 
#    thal, family = "binomial", data = data)

# Deviance Residuals: 
#     Min       1Q   Median       3Q      Max  
# -3.1539  -0.4667  -0.1224   0.3516   2.8068  

# Coefficients:
#             Estimate Std. Error z value Pr(>|z|)    
# (Intercept) -5.76388    2.41809  -2.384 0.017142 *  
# sexM         1.62905    0.51053   3.191 0.001418 ** 
# cp2          1.11607    0.77469   1.441 0.149676    
# cp3          0.23770    0.69351   0.343 0.731790    
# cp4          2.45240    0.68466   3.582 0.000341 ***
# trestbps     0.02727    0.01040   2.622 0.008729 ** 
# thalach     -0.01953    0.01054  -1.852 0.063963 .  
# slope2       1.65465    0.45251   3.657 0.000256 ***
# slope3       1.33651    0.74930   1.784 0.074477 .  
# ca3          2.08423    0.48191   4.325 1.53e-05 ***
# ca4          3.09393    0.68382   4.524 6.05e-06 ***
# ca5          2.05381    0.86750   2.368 0.017909 *  
# thal3       -0.24157    0.75636  -0.319 0.749430    
# thal4        1.46955    0.42130   3.488 0.000486 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for binomial family taken to be 1)

#    Null deviance: 409.95  on 296  degrees of freedom
# Residual deviance: 194.20  on 283  degrees of freedom
# AIC: 222.2

# Number of Fisher Scoring iterations: 6

# Test the null hypothesis : the reduced model is true.(-2)log likelihood ratio test follows chi-square distribution. 
x2=logistic.r$deviance-logistic.f$deviance
d=length(logistic.f$coefficients)-length(logistic.r$coefficients)
d
# [1] 7
> 1-pchisq(x2,d)
# [1] 0.1343539
# p-value of H0 is greater than 0.05, fail to reject H0. Accept the reduced model.
