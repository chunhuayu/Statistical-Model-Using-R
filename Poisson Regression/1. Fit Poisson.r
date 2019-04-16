# Background: An engineering researcher group works on a project aimed at reducing jams on a large collating machine.
# they ran the machine at 3"Air Pressure" settings and 2" Bar Tightness" conditions and 
# observe y = the number of machine jams experiencedj in k seconds of machine run time.
# (Run time does not include the machine "down" time required to fix the jams). Their results as Jams.csv
> a=c(1,2,3,1,2,3)
> b=c(1,1,1,2,2,2)
> y=c(27,21,33,15,6,11)
> k=c(295,416,308,474,540,498)
> aa=as.factor(a)
> bb=as.factor(b)
> options(contrasts=c("contr.sum","contr.sum"))
> collator.out=glm(y~aa+bb,family = poisson,offset = log(k))
> summary(collator.out)

# Call:
# glm(formula = y ~ aa + bb, family = poisson, offset = log(k))

# Deviance Residuals: 
#       1        2        3        4        5        6  
# -0.5040   0.1693   0.3442   0.7453  -0.3004  -0.5532  

# Coefficients:
#            Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -3.2159     0.1068 -30.098  < 2e-16 ***
# aa1           0.2420     0.1313   1.844  0.06521 .  
# aa2          -0.4856     0.1472  -3.299  0.00097 ***
# bb1           0.6781     0.1045   6.490 8.56e-11 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for poisson family taken to be 1)

#    Null deviance: 59.201  on 5  degrees of freedom
# Residual deviance:  1.353  on 2  degrees of freedom
# AIC: 37.188

# Number of Fisher Scoring iterations: 4

> B=collator.out$coefficients
> B
# (Intercept)         aa1         aa2         bb1 
#-3.2158569   0.2420326  -0.4856216   0.6781461 
