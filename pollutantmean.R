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
    
    data_path <- file.path(getwd(),directory)
    
    file_names <- list.files(path = data_path , pattern="*.csv")
    temp_sum <- 0
    temp_count <- 0
    
    for (i in seq(from = 1, to = length(id))) {
        cur_frame <- read.csv(file=file.path(data_path , file_names[id[i]]))
        temp_sum <- temp_sum + sum(cur_frame[[pollutant]], na.rm = TRUE)
        temp_count <- temp_count + sum(!is.na(cur_frame[[pollutant]]), na.rm = TRUE)
    }
    temp_sum/temp_count
}