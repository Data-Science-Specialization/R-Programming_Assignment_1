complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    data_path <- file.path(getwd(),directory)
    
    file_names <- list.files(path = data_path , pattern="*.csv")
    nobs <- numeric(length(id))
    
    for (i in seq(from = 1, to = length(id))) {
        cur_frame <- read.csv(file=file.path(data_path , file_names[id[i]]))
        nobs[i] <- sum(complete.cases(cur_frame))
    }
    nobs_frame <- data.frame(id, nobs)
    rm('cur_frame')
    nobs_frame
}