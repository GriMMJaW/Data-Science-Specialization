#Get Monitor function
getmonitor <- function(id,directory,summarize = FALSE)
{ csv = ".csv"
  
  id_char = formatC(id,width = 3, flag = "0")
  final_directory = paste(directory,"/",id_char,csv, sep = "")
  
  if(summarize == FALSE)
    {
      file <- read.csv(final_directory,header = TRUE )
      file
    }
  else if(summarize ==TRUE )
    {
      file <- summary(read.csv(final_directory))
      file
    }
  else{ "Summary Value can be either True or False" }
}

