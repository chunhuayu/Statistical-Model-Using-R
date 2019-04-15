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

# conclusion: temperature has a significant effect for the O-ring failure. 
# Temperature has a significant linear relationship with the log(odds)
