library(TSA)
data("hare")
# give the time series plot of this abundance over about 30 years
plot(hare,ylab='Abundance',xlab='Year',type='o')

# plotted abun- dance versus the previous year’s abundance.
# we see an upward trend in the plot—low values tend to be followed by low values in the next year, 
# middle-sized values by middle-sized values, and high values by high values.
plot(y=hare,x=zlag(hare),ylab='Abundance',xlab='Previous Year Abundance')

# displays the log-likelihood as a func- tion of the power parameter􏱟
tr=BoxCox.ar(hare)
tr
hare.tr=sqrt(hare)

# It gives strong evidence to support an AR(2) or possibly an AR(3) model for these data.
acf(hare.tr,xaxp=c(0,20,10))
pacf(hare.tr,xaxp=c(0,20,10))

hare.fit=arima(hare.tr,order=c(3,0,0))
acf(residuals(hare.fit))
LB.test(hare.fit,lag = 9)

# Test normality
runs(residuals(hare.fit))

#QQplot
qqnorm(residuals(hare.fit))
qqline(residuals(hare.fit))

# Test normality
shapiro.test(residuals(hare.fit))
