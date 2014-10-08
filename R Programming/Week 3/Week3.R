#simulation Function
#rnorm, dnorm, pnorm,rpois
#Function names starting with the following have the following meanings
# d is for density functions
#r for random generators
#p cumulative distribution
#q is for quantile function

x <- rnorm(10)
print(x)
x <- rnorm(10, 20, 2)
print(x)
summary(x)

set.seed(1) #Sam random numbers will be generated if the seed is set to same value before generating the number.


#Generating a distribution from a given function
#Suppose we are trying to generate a distribution from function 
#y <- 0.5 +2*x + e
#Where,
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 +2*x + e
View(y)
summary(y)
plot(x,y)
help(plot)


x <- 1:100
e <- rnorm(100,0,1)
y <- 1.5 - 3*x + e
View(y)


###Plotting
#Few recommended packages for plotting are graphics, lattice, grid, grDevices
plot(x,y)
hist(x)
help(par)
