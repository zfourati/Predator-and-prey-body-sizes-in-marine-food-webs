
load_data <- function(file_path) {
    # Read the CSV file
    data_clean <- read.csv(
        file_path,
        header = TRUE,
        sep = ",",
        quote = "\"", 
        stringsAsFactors = FALSE)
    
    # Convert column names to lowercase
    names(data_clean) <- tolower(names(data_clean))
    
    # Return the cleaned data frame
    return(data_clean)
}

remove_outliers <- function(x, na.rm = TRUE) {
    qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm)
    H <- 1.5 * IQR(x, na.rm = na.rm)
    y <- x
    y[x < (qnt[1] - H)] <- NA
    y[x > (qnt[2] + H)] <- NA
    
    y <- na.omit(y)

    # Check how many outliers were removed
    original_count <- length(x)
    clean_count <- sum(!is.na(y))
    outliers_removed <- original_count - clean_count

    cat("Original data points:", original_count, "\n")
    cat("Clean data points:", clean_count, "\n") 
    cat("Outliers removed:", outliers_removed, "\n")
    cat("Percentage of outliers:", round((outliers_removed/original_count)*100, 2), "%\n")

    return(y)
}



