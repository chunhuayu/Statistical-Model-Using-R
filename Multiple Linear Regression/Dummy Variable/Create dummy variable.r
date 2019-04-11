# As part of a study on control of hazardous waste, Stelling and Sjerps (1999) report data on total polycyclic 
# aromatic hydrocarbons (PAHs) observed in lots of fractionated demolition waste (in mg/kg). To assess if there is 
# any difference in PAH concentrations across lots. Set significance level to 10%.

> waste=read.csv(file.choose(),header = T)
> lot.d=as.factor(waste[,2])
> lot.d
 [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4
[37] 4 4 4 4 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6
Levels: 1 2 3 4 5 6
> waste.y=waste[,1]
> fit.0=glm(waste.y~lot.d,family = gaussian)
> summary(fit.0)

Call:
glm(formula = waste.y ~ lot.d, family = gaussian)

Deviance Residuals: 
   Min      1Q  Median      3Q     Max  
-86.65  -19.56   -3.12   11.27  125.26  

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   131.15      14.16   9.262 9.60e-13 ***
lot.d2         -3.18      20.03  -0.159   0.8744    
lot.d3       -105.72      20.03  -5.279 2.36e-06 ***
lot.d4         -0.65      20.03  -0.032   0.9742    
lot.d5          1.59      20.03   0.079   0.9370    
lot.d6        -43.72      20.03  -2.183   0.0334 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for gaussian family taken to be 2005.034)

    Null deviance: 200939  on 59  degrees of freedom
Residual deviance: 108272  on 54  degrees of freedom
AIC: 634.16

Number of Fisher Scoring iterations: 2

> plot(residuals(fit.0))
> shapiro.test(residuals(fit.0))

	Shapiro-Wilk normality test

data:  residuals(fit.0)
W = 0.8773, p-value = 2.155e-05
# the residuals does not normally distribute

# consider to transform 
> library(TSA)
> BoxCox.ar(waste.y)
> waste.yt=sqrt(waste.y)
> fit.1=glm(waste.yt~lot.d,family = gaussian)
> summary(fit.1)

Call:
glm(formula = waste.yt ~ lot.d, family = gaussian)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-4.5788  -1.2916  -0.0016   0.6724   4.8204  

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 11.249638   0.632894  17.775  < 2e-16 ***
lot.d2      -0.122648   0.895047  -0.137   0.8915    
lot.d3      -6.433720   0.895047  -7.188 2.04e-09 ***
lot.d4       0.042838   0.895047   0.048   0.9620    
lot.d5      -0.007693   0.895047  -0.009   0.9932    
lot.d6      -1.968936   0.895047  -2.200   0.0321 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for gaussian family taken to be 4.005549)

    Null deviance: 549.03  on 59  degrees of freedom
Residual deviance: 216.30  on 54  degrees of freedom
AIC: 261.21

Number of Fisher Scoring iterations: 2

> shapiro.test(residuals(fit.1))

	Shapiro-Wilk normality test

data:  residuals(fit.1)
W = 0.95122, p-value = 0.01777
