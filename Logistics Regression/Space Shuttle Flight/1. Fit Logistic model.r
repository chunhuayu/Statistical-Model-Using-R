space=read.csv(file.choose(),head=T)
# fit logistic regression.
y=space[,2]
temp=space[,1]
spacelog=glm(y~temp,data = space,family = 'binomial')
summary(spacelog)
# Call:
# glm(formula = y ~ temp, family = binomial, data = space)

# Deviance Residuals: 
#    Min       1Q   Median       3Q      Max  
# -1.0611  -0.7613  -0.3783   0.4524   2.2175  

# Coefficients:
#            Estimate Std. Error z value Pr(>|z|)  
# (Intercept)  15.0429     7.3786   2.039   0.0415 *
# temp         -0.2322     0.1082  -2.145   0.0320 *
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for binomial family taken to be 1)

#    Null deviance: 28.267  on 22  degrees of freedom
# Residual deviance: 20.315  on 21  degrees of freedom
# AIC: 24.315

# Number of Fisher Scoring iterations: 5

# conclusion: temperature has a significant effect for the O-ring failure. 
# Temperature has a significant linear relationship with the log(odds)

# calculate the fitted probability of response
spacefit=predict.glm(spacelog,type = 'response',se.fit=TRUE)
spacefit

# $fit
#         1          2          3          4          5          6          7 
# 0.43049313 0.22996826 0.27362105 0.32209405 0.37472428 0.15804910 0.12954602 
#         8          9         10         11         12         13         14 
# 0.22996826 0.85931657 0.60268105 0.22996826 0.04454055 0.37472428 0.93924781 
#         15         16         17         18         19         20         21 
# 0.37472428 0.08554356 0.22996826 0.02270329 0.06904407 0.03564141 0.08554356 
#        22         23 
# 0.06904407 0.82884484 

# $se.fit
#         1          2          3          4          5          6          7 
# 0.14553689 0.10540934 0.11220218 0.12088266 0.13207135 0.09370605 0.08747767 
#         8          9         10         11         12         13         14 
# 0.10540934 0.15848696 0.18500921 0.10540934 0.05182258 0.13207135 0.09775842 
#        15         16         17         18         19         20         21 
# 0.13207135 0.07354639 0.10540934 0.03359587 0.06618193 0.04519991 0.07354639 
#        22         23 
# 0.06618193 0.17218144 

# $residual.scale
# [1] 1
