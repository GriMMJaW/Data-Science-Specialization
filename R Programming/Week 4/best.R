library(data.table)
best <- function(state,outcome)
{
    ##Reading the Data
    mydata <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available", header = TRUE)
    mydata <- data.table(mydata)
    
    ##Check if state and outcome are valid
    mydata <- mydata[mydata$State == state,]
    if(nrow(mydata) == 0)
    {
        stop("invalid state")
    }
    mydata <- data.frame(mydata)
    switch(outcome,
           "heart attack" = (option = 13),
           "heart failure" = (option = 19),
           "pneumonia" = (option = 25),
           stop("invalid outcome"))
    mydata <- na.omit(mydata)
    ##Return hospital name in that state with lowest 30-day death
    minimum <- min(as.numeric(mydata[,option]))
    minlist <- c()
    ###If j is assigned 1L then an error is thrown.
    j = 1
    for(i in 1:nrow(mydata))
    {
        if(as.numeric(mydata[i,option]) == minimum)
        {
            minlist[j] <- (mydata[i,2])
            j = j + 1
        }
    }
    sort(minlist)
    print(minlist[1])
}
