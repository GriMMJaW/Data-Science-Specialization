rankall <- function(outcome, num = "best") 
{
    ##Checking Validity of arguments
    switch(outcome,
           "heart attack" = (option = 11),
           "heart failure" = (option = 17),
           "pneumonia" = (option = 23),
           stop("invalid outcome"))
    ## Read outcome data
    
    mydata <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available", header = TRUE)
    
    newdata <- mydata[,c(2,7,option)]
    newdata <- na.omit(newdata)
    newdata <- split(newdata,newdata$State)
    hospital <- c()
    state <- c()
    for(i in 1:54)
    {
        i = as.numeric(i)
        ordereddata <- newdata[i]
        ordereddata <- data.frame(ordereddata)
        ordereddata <- ordereddata[order(ordereddata[,1]),]
        ordereddata <- ordereddata[order(as.numeric(ordereddata[,3])),]
        if(num == "best")
        {
            hospital[i] <- ordereddata[1,1]  
            state[i] <- ordereddata[1,2]  
        }
        else if(num == "worst")
        {
            hospital[i] <- ordereddata[nrow(ordereddata),1]
            state[i] <- ordereddata[nrow(ordereddata),2] 
        }
        else if(num > nrow(ordereddata))
        {
            hospital[i] <- "<NA>"
            state[i] <- ordereddata[1,2] 
        }
        else
        {
            hospital[i] <- ordereddata[num,1]
            state[i] <- ordereddata[num,2] 
        }    
    }
    output <- data.frame(hospital,state)
    print(output)
}
