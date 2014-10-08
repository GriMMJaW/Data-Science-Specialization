

Libraries Used:
library(lattice)

mydata <- mtcars
quartz()
splom(mtcars)

fit <- lm(mpg~.,data=mydata)
#In the above data there is no significant regressor except weight that seems to be affecting the mpg variable. This makes us question the validity of the model and creates a need to filter out the extra variables we might have added in.
#On further observation some variables are quite obviously related. Thus we eliminate some of the variables by judgement calls.
#   1] The time the car takes to travel a quarter mile will definitely reduce wit the increase in horsepower. Thus, we eliminate qsec an keep in horsepower.
#   2] The weight and number of cylinders are highly correlated. We keep weight of  the vehicle and discard cylinder.
#   In the similar way by making judgement calls we fit the data as follows:
fit <- lm(mpg~disp+wt+factor(vs)+qsec+factor(am),data=mydata)
fit <- lm(mpg~hp+wt+factor(vs)+qsec+factor(am),data=mydata)
fit <- lm(mpg~wt+qsec+factor(am),data=mydata)
anova(fit,fit1)
fit_interactions <- update(fit,mpg~wt+qsec+factor(am)+wt*qsec*factor(am))
anova(fit,fit_interactions)
fit <- lm(mpg~wt+qsec+factor(am)+wt*qsec*factor(am)-wt:qsec:factor(am),data=mydata)
final_fit <- lm(mpg~wt+qsec+factor(am)+wt*factor(am),data=mydata)

#Residual plot
plot(mydata$mpg,resid(final_fit),xlab="M")
abline(0,0)
#The above plot shows no pattern suggesting that the data is not faulty.

#Confidence Intervals for the co-efficients at alpha=0.05
qt(0.975,df=summary(final_fit)$df[2])
#For weight
conf_am_0 = coef(final_fit)[1] + c(1,-1)*qt(0.975,df=summary(final_fit)$df[2])
conf_am_1 = coef(final_fit)[1]+coef(final_fit)[4] + c(1,-1)*qt(0.975,df=summary(final_fit)$df[2])


