### Background: This is a study that was undertaken to dermine the strength of association between several risk
### factors and the duration of pregnancies. the risk factors considered were mother's age, nutritional status,
### history of tobacco use , and history of alcohol use. the response of interest, pregnancy duration, is a three-category
### variable that was coded as follows:
# --------------------------------------------#           #------------------------------------------------#
# y(i)  Pregnancy duration Category.          #           # age(i)                  Class                  #
# 1     Preterm (less than 36 weeks).         #           #  1      Less than or equal to 20 years of age  #
# 2     Intermediate term (36 to 37 weeks)    #           #  2      21 to 30 years of age                  #
# 3     Full term(38 weeks or greater)        #           #  3      Greater than 30 years of age           #
#---------------------------------------------#           #------------------------------------------------#

### Doing this model will use the following packages: "foreign" and "nnet"
> library(foreign)
> library(nnet)
> preg=read.csv(file.choose(),header = T)
> head(preg)
#   obs Duration Nutritional.status Alcohol.History Smoking.History age
# 1   1        1                150               0               1   2
# 2   2        1                124               0               0   1
# 3   3        1                128               0               1   2
# 4   4        1                128               0               1   1
# 5   5        1                133               1               1   2
# 6   6        1                130               1               1   2
> age=preg[,6]
> nut=preg[,3]
> alco=preg[,4]
> smoke=preg[,5]
> age=as.factor(age)
> y=preg[,2]
> y=as.factor(y)

### set the reference level
> y.f=relevel(y,ref = 3)

### fit the model, there are three catigorical variables and a continuous variable.
> pregModel=multinom(y.f~nut+alco+smoke+age)
# weights:  21 (12 variable)
# initial  value 112.058453 
# iter  10 value 86.603311
# iter  20 value 84.337718
# iter  20 value 84.337718
# iter  20 value 84.337718
# final  value 84.337718 
# converged

### Summary will give the coefficients and standard errors of each parameters
> w=summary(pregModel)
> w
Call:
multinom(formula = y.f ~ nut + alco + smoke + age)

Coefficients:
  (Intercept)         nut     alco    smoke     age1      age2
1    7.147554 -0.06542111 2.042979 2.452464 1.284816 -1.672277
2    5.558597 -0.04644814 1.067037 2.230534 1.313147 -1.600371

Std. Errors:
  (Intercept)        nut      alco     smoke      age1      age2
1    2.344338 0.01823948 0.7097567 0.7315231 0.6020852 0.5121297
2    1.989620 0.01488574 0.6495297 0.6682013 0.5353794 0.4591886

Residual Deviance: 168.6754 
AIC: 192.6754 

### 95% confident interval for each estimator
> ci.w.coef=confint(pregModel)
> ci.w.coef
# , , 1

#                  2.5 %      97.5 %
# (Intercept)  2.5527360 11.74237144
# nut         -0.1011698 -0.02967238
# alco         0.6518813  3.43407652
# smoke        1.0187049  3.88622276
# age1         0.1047513  2.46488175
# age2        -2.6760326 -0.66852093

# , , 2

#                   2.5 %      97.5 %
# (Intercept)  1.65901372  9.45818018
# nut         -0.07562365 -0.01727262
# alco        -0.20601792  2.34009188
# smoke        0.92088346  3.54018441
# age1         0.26382237  2.36247109
# age2        -2.50036386 -0.70037782

