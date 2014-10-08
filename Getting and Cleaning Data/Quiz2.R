#First Question
install.packages("httr")
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", "7a4526544679ca9c1d22","91a03d8eb5e3c22c046b8d705acc35ddfb9d5255")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))

#Second Question
acs <- read.csv("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz 2/getdata-data-ss06pid.csv")
sqldf("select distinct AGEP from acs")

#Third Question
library(httr)
library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlCode <- readLines(url(url))
View(nchar(htmlCode)[c(10,20,30,100)])


#Fourth Question
mydata <- read.fwf("/Users/GrimmJaW/Box Sync/IE/Extra/Data Science/Getting and Cleaning Data/Data/Quiz 2/getdata-wksst8110.for",skip = 1,widths = c(15,4,9,4,9,4,9,4,4))
sum(mydata$V4)
