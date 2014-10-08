#For loop
#The condition variable(here x) can only be a scalar
x <- 4
x<- 1
y <- if(x>3) {
  10
}else{
   0
     }
print (y)

for (i in 1:10){
  print(i)
}

help(seq_len)


z <- 3
i <- 0

while(z<10)
{
  print(z)
  coin <- rbinom(1,1,0.5)    
  if(coin == 1)
    {
      z <- z+1
    }
  else(coin ==0)
    {
      z <- z - 1
    }
}


#One interesting difference between R and other languages is that it allows a funtion to 
#be defined inside another function.
#EG:
make.power <- function(n)
  {
    pow <- function(x)
      {
        x^n
      }
    pow
  }
cube = make.power(3)
square = make.power(2)
ls(environment(cube))  #Lexical Scoping

args(glm)


#The apply functions
help(lapply)
args(lapply)
str(lapply)
help(tapply)
help(sapply)
help(apply)
help(mapply)

help(runif)
args(runif)

help(quantile)

str(gl)
help(gl)
environment(gl)
install.packages("base")
library(help='base')
help(R.home)
#One of the best application of split function is that it enables one to split the data according to a values in the column. So it can be wonderfully used in combination with lapply and sapply.

help(interaction)
help(split)

help(rep)

environment(rep)
rep(1:4, c(2,2,2,2))
rep(1:4, c(2,1,2,1))
mapply(rep, 1:4, range(4))
help(invisible)
#Debugging Tools

help(traceback)
help(debug)
help(browser)
help(trace)
help(recover)
recover()
debug(lm)

lm(x~y)
#Random Function
help(eval)
help(options)

install.packages(datasets)
data(iris)
test <- iris
View(test)

species <- split(test$Sepal.Length,test$Species)
species
species[3]
lapply(split(test$Sepal.Length,test$Species), mean)
apply(iris[,1:4],2,mean)

View(mtcars)
mpgavg <- sapply(split(mtcars$mpg,mtcars$cyl),mean)
abs(mpgavg[3]-mpgavg[1])
help(abs)

z<-10
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}
f(3)
