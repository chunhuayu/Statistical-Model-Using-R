### Simulate an ARMA(1,1) process with ar=0.6, ma=-0.4, and mean=100. 
set.seed(15716)
data1=arima.sim(n=60,list(ar=0.6,ma=0.4))+100

### Set aside the last 10 values to compare forecasts with actual values.
data1.1st=window(data1,end=50)
data1.2nd=window(data1,start=51)

### Using the first 50 values of the series, find the values for the maximum likelihood estimates of ar and ma.
model1=arima(data1.1st,order = c(1,0,1))
model1

### Using the estimated model, forcast the next 10 values of the series. Plot series together with the 10 forecasts.
model1.FC=plot(model1,n.ahead=10,ylab = 'Data1(Forecasts)',pch=19)$pred
abline(h=coef(model1)[names(coef(model1))=='intercept'])
model1.FC
# Time Series:
# Start = 51 
# End = 60 
# Frequency = 1 
# [1] 100.6099 100.3406 100.2203 100.1666 100.1426 100.1318 100.1270 100.1249 100.1239 100.1235


### Compare 10 forecasts with the actual values you set aside.
AC.FC=cbind(data1.2nd,model1.FC$pred)
AC.FC
# Time Series:
# Start = 51 
# End = 60 
# Frequency = 1 
#    data1.2nd model1.FC$pred
# 51 101.60334       100.6099
# 52 102.11194       100.3406
# 53 100.66867       100.2203
# 54 100.23541       100.1666
# 55 100.24066       100.1426
# 56  98.39140       100.1318
# 57  98.69198       100.1270
# 58 100.44735       100.1249
# 59 100.63078       100.1239
# 60  99.63098       100.1235

### Plot the forecasts together with 95% forecast limits.
plot(model1,n.ahead=10,ylab = 'Data1 with Forecasts',pch=19)$pred
points(data1.2nd,pch=12)
abline(h=coef(model1)[names(coef(model1))=='intercept'])
