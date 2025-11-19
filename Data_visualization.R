
weibull_transformation <- function(column) {
    # Weibull transformation for right-skewed data
    # Filter out problematic values and use adaptive threshold
    
    # Use a percentile-based threshold to avoid very small values
    threshold_percentile <- quantile(column, 0.001, na.rm = TRUE)  # Remove bottom 0.1%
    min_threshold <- max(0.1, threshold_percentile)  # At least 0.1 or the 0.1th percentile
    
    col_pos <- column[column >= min_threshold & !is.na(column)]
    
    cat("Original data points:", length(column), "\n")
    cat("Filtered data points:", length(col_pos), "\n")
    cat("Removed", length(column) - length(col_pos), "problematic values\n")
    cat("Using threshold:", round(min_threshold, 4), "\n")
    
    # Try fitting with better error handling and suppress warnings
    tryCatch({
        # Suppress warnings during fitting to avoid NaN messages
        suppressWarnings({
            weibull_fit <- fitdistr(col_pos, "weibull", 
                                   start = list(shape = 1.5, scale = median(col_pos)),
                                   lower = c(0.1, 0.1))  # Set lower bounds
        })
        
        shape_param <- weibull_fit$estimate["shape"]
        scale_param <- weibull_fit$estimate["scale"]
        
        cat("Estimated Weibull parameters:\n")
        cat("Shape:", round(shape_param, 4), "\n")
        cat("Scale:", round(scale_param, 4), "\n")
        
        # Apply Weibull transformation (using quantile transformation)
        n <- length(col_pos)
        ranks <- rank(col_pos)
        uniform_values <- ranks / (n + 1)
        
        # Transform uniform values to Weibull distribution with shape=2 for more symmetric distribution
        weibull_transformed_column <- qweibull(uniform_values, shape = 2, scale = 1)
        
        cat("✓ Transformation completed successfully!\n")
        return(weibull_transformed_column)
        
    }, error = function(e) {
        cat("Error in Weibull fitting:", e$message, "\n")
        cat("Using log transformation as fallback...\n")
        
        # Alternative: use log transformation if Weibull fails
        return(log(col_pos + 1))
    })
}


hist_plot <- function(column, main, xlab, color = "darkmagenta", breaks=30) {
    hist(column,
         main = main,
         xlab = xlab,
         col = color,
         freq = FALSE,
         breaks = breaks
    )
    
    # Add a density curve
    lines(density(column), col = "blue", lwd = 2)
}


qq_plot_comparison <- function(original_data, transformed_data, 
            title_original="Q-Q Plot: Original Data", 
            title_transformed="Q-Q Plot: Transformed Data") {

    par(mfrow=c(1,2))

    # Q-Q plot for original data
    qqnorm(original_data, main=title_original, col="lightblue")
    qqline(original_data, col="blue", lwd=2)

    # Q-Q plot for transformed data
    qqnorm(transformed_data, main=title_transformed, col="darkmagenta")
    qqline(transformed_data, col="blue", lwd=2)

    # Reset plotting parameters
    par(mfrow=c(1,1))
}