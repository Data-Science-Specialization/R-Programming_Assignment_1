corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    data_path <- file.path(getwd(),directory)
    file_names <- list.files(path = data_path , pattern="*.csv")
    
    all_complete <- complete(directory)
    req_complete <- all_complete[all_complete$nobs > threshold, ]
    
    cors <- numeric(dim(req_complete)[1])
    
    if (dim(req_complete)[1] > 0) {
        for (i in seq(from = 1, to = dim(req_complete)[1])) {
            cur_frame <- read.csv(file=file.path(data_path , file_names[req_complete[i,1]]))
            cors[i] <- cor(cur_frame[['sulfate']], cur_frame[['nitrate']], use = 'complete.obs')
        }
    }
    cors
}