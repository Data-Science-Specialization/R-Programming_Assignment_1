pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    data_path <- file.path(getwd(),'specdata')
    
    file_names <- list.files(path = data_path , pattern="*.csv")
    temp_mean <- numeric(length(id))
    
    for (i in id) {
        cur_frame <- read.csv(file=file.path(data_path , file_names[i]))
        temp_mean[i] <- mean(cur_frame[pollutant], na.rm = TRUE)
    }
    mean(temp_mean, na.rm = TRUE)
}