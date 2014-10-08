x <- 1
print (x)

x <- 0:20
print (x)
as.numeric(x)
as.logical(x)
as.character(x)

m <- matrix(1:6, nrow = 3,ncol = 2)
m
dim (m)
attributes(m)
help(matrix)
y <- factor(c("X", "Y","Y","X","X"))
unclass(y)
Logic <- factor(c("No","Yes","No"))
Logic
unclass(Logic)
help(labels)

x <- list(aaablab = 1:10, anurag = 1:11, cat = c("A","B"))
y <- 1:10
x+y

m1 <- matrix(1:4,1,4)
m2 <- matrix(11:14,4,1)
m1+m2
m2
m1 %*% m2
help(read.table)
getwd()
help(sapply)
dput(m)
y <- data.frame(a = 1,b = "a")
dput(y, file = "Y.R")
dget("Y.R")
str(c)
install.packages("datasets")
library(datasets)
library(help = "datasets")
ChickWeight
summary(ChickWeight)
str(ChickWeight)
split(ChickWeight, ChickWeight$Time)



###Read.table is very important. Know all the arguments very well.

help(read.table)