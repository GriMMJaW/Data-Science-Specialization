rankhospital <- function(state,outcome, number = "best")
{
    ##Reading the Data
    mydata <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available", header = TRUE)
    
    ##Check if state and outcome are valid
    mydata <- mydata[mydata$State == state,]
    if(nrow(mydata) == 0)
    {
        stop("invalid state")
    }
    switch(outcome,
           "heart attack" = (option = 11),
           "heart failure" = (option = 17),
           "pneumonia" = (option = 23),
           stop("invalid outcome"))
    mydata <- mydata[order(mydata$Hospital.Name),] 
    mydata <- mydata[order(as.numeric(mydata[,option])),]
    mydata <- na.omit(mydata)
    
    ##Return hospital name in that state with lowest 30-day death
    if(number == "best")
    {
        print(mydata$Hospital.Name[1])
    }
    else if(number == "worst")
    {
        print(mydata$Hospital.Name[length(mydata$Hospital.Name)])   
    }
    else
    {
        if(number > nrow(mydata))
        {
            "NA"
        }
        print(mydata$Hospital.Name[number])
    }     
}
# 
# rankhospital("MD", "heart attack", "worst")
# rankhospital("TX", "heart failure", 5000)

