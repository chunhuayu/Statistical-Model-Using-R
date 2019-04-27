### Using deere3 dataset, make a time series plot for the data set. 
data(deere3)
plot(deere3,type='o',ylab='Deviations')
### Plot the ACF and PACF of the data set.
acf(deere3)
pacf(deere3)
### Identify the appropriate ARMA model to fit the data and give the fitted model.
eacf(deere3)
### Use appropriate plots of standard residuals to do MODEL CHECKING and comment on those plots.
model2=arima(deere3,order=c(1,0,0))
plot(rstandard(model2),ylab ='Standardized Residuals',type='o'); abline(h=0)
### Use the fitted model to forecast the next 10 values.
plot(model2,n.ahead=10)$pred
### Plot the time series, the forecasts, and 95% forecast limits.
plot(model2,n.ahead = 10,ylab = 'Deviations',xlab='Year',pch=19)
abline(h=coef(model2)[names(coef(model2))=='intercept'])
