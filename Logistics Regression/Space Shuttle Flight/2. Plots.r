# calculate the confidence interval with 2 standard error
ci.L=spacefit$fit-2*spacefit$se.fit
ci.H=spacefit$fit+2*spacefit$se.fit

# calculate the odds
coe.b0=spacelog$coefficients[1]
coe.b1=spacelog$coefficients[2]
odds=exp(coe.b0+coe.b1*temp)

# create a new data.frame
space.data=data.frame(space, spacefit$fit, spacefit$se.fit, ci.L, ci.H)
colnames(space.data)=c("temp","incd","fitted","sefit","ciL","ciH")

# using ggplot2 package
# Plot the fitted Sigmoidal
# plot estimated means versus temperature
# Plot "2 standard error band" around the response function
# break down the x-axis and y-axis into the specified unit.
library(ggplot2)

p=ggplot(space.data,aes(temp,incd))
p+
  geom_line(data = space.data,aes(temp,fitted))+
  geom_point(data = space.data,aes(temp,incd),size=2,shape=21 )+ 
  geom_ribbon(data =space.data,aes(ymin=ciL,ymax=ciH),alpha=0.3)+
  geom_line(y=1,color="darkgrey")+geom_line(y=0,color="darkgrey")+
  geom_point(data=space.data,aes(temp,fitted))+
  labs(title="Temp vs O-ring Incident",y="Probability of Incident")+
  scale_y_continuous(breaks = c(0,0.2,0.4,0.6,0.8,1,1.2))+
  scale_x_continuous(breaks = c(50,55,60,65,70,75,80,85))
