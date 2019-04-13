> logistic=glm(hd~sex,data = data,family = "binomial")
> summary(logistic)

# Call:
# glm(formula = hd ~ sex, family = "binomial", data = data)

# Deviance Residuals: 
#     Min       1Q   Median       3Q      Max  
# -1.2765  -1.2765  -0.7768   1.0815   1.6404  

# Coefficients:
#            Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -1.0438     0.2326  -4.488 7.18e-06 ***
# sexM          1.2737     0.2725   4.674 2.95e-06 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for binomial family taken to be 1)

#   Null deviance: 409.95  on 296  degrees of freedom
# Residual deviance: 386.12  on 295  degrees of freedom
# AIC: 390.12

# Number of Fisher Scoring iterations: 4

# odds = p(x)/(1-p(x)), p(x) is the probability of x.
# log(odds)= -1.0438 +1.2737*X ;(X is 0 when the patient is female, 1 when the patient is male.)
# Since the first term is the log(odds) of a female having heart disease, 
# the second term indicates the increase in the log(odds) that a male has of having heart disease
# in other words, the second term is the log(odds ration) of the odds that a male will have heart disease over the odds 
# that a female will have heart disease. Both p value are well below 0.05, and thus, the log(odds) and log(odds ration) are 
# both statistically significant.But remember, a small p value alone is not interesting, we also want large effect size, 
# and that's what the log(odds) and log(odds ratio) tells us
# when we do "normal" linear regression, we estimate both the mean and the variance from the data. In contrast, with logistic 
# regression, we estimate the mean of the data, and the variance is derived from the mean. Since we are not estimating the 
# variance from the data(and, instead, just deriving it from the mean), it is possible that the variance is underestimated.
# AIC: Akaike information Criterion which in this context is justthe residual deviance adjusted for the number of 
# parameters in the model. AIC can be used to compare one model to another.
# Lastly, we have the number of Fisher Scoring iterations, which just tells us how quickly the glm() function converged on 
# the maximum likelihood estimates for the coefficients

logistic.f=glm(hd ~ .,data = data, family = 'binomial')
summary(logistic.f)

# Call:
# glm(formula = hd ~ ., family = "binomial", data = data)

# Deviance Residuals: 
#    Min       1Q   Median       3Q      Max  
# -3.0490  -0.4847  -0.1213   0.3039   2.9086  

# Coefficients:
#             Estimate Std. Error z value Pr(>|z|)    
# (Intercept) -6.253978   2.960399  -2.113 0.034640 *  
# age         -0.023508   0.025122  -0.936 0.349402    
# sexM         1.670152   0.552486   3.023 0.002503 ** 
# cp2          1.448396   0.809136   1.790 0.073446 .  
# cp3          0.393353   0.700338   0.562 0.574347    
# cp4          2.373287   0.709094   3.347 0.000817 ***
# trestbps     0.027720   0.011748   2.359 0.018300 *  
# chol         0.004445   0.004091   1.087 0.277253    
# fbs1        -0.574079   0.592539  -0.969 0.332622    
# restecg1     1.000887   2.638393   0.379 0.704424    
# restecg2     0.486408   0.396327   1.227 0.219713    
# thalach     -0.019695   0.011717  -1.681 0.092781 .  
# exang1       0.653306   0.447445   1.460 0.144267    
# oldpeak      0.390679   0.239173   1.633 0.102373    
# slope2       1.302289   0.486197   2.679 0.007395 ** 
# slope3       0.606760   0.939324   0.646 0.518309    
# ca3          2.237444   0.514770   4.346 1.38e-05 ***
# ca4          3.271852   0.785123   4.167 3.08e-05 ***
# ca5          2.188715   0.928644   2.357 0.018428 *  
# thal3       -0.168439   0.810310  -0.208 0.835331    
# thal4        1.433319   0.440567   3.253 0.001141 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for binomial family taken to be 1)

#    Null deviance: 409.95  on 296  degrees of freedom
# Residual deviance: 183.10  on 276  degrees of freedom
# AIC: 225.1

# Number of Fisher Scoring iterations: 6

# age has a large p value that represents age is not useful, however, the median age in our dataset was 56
# so most of the folks were pretty old and that explains why it was not very useful.
# compare to the previous simple model, both the deviance and AIC are smaller.

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

# Test the null hypothesis : the reduced model is true.
x2=logistic.r$deviance-logistic.f$deviance
length(logistic.f$coefficients)-length(logistic.r$coefficients)
# [1] 7
> 1-pchisq(x2,7)
# [1] 0.1343539
# p-value of H0 is greater than 0.05, fail to reject H0. Accept the reduced model.
