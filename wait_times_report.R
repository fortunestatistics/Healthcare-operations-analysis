# wait_times_report.R

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)

# Function to load hospital wait times data
load_data <- function(file_path) {
    data <- read_csv(file_path)
    return(data)
}

# Function to analyze wait times
analyze_wait_times <- function(data) {
    analysis <- data %>% 
        group_by(hospital) %>% 
        summarize(avg_wait_time = mean(wait_time, na.rm = TRUE),
                  max_wait_time = max(wait_time, na.rm = TRUE),
                  min_wait_time = min(wait_time, na.rm = TRUE))
    return(analysis)
}

# Function to create visualizations
create_visualizations <- function(analysis) {
    plot <- ggplot(analysis, aes(x = hospital, y = avg_wait_time)) +
        geom_bar(stat = 'identity') +
        labs(title = 'Average Hospital Wait Times', x = 'Hospital', y = 'Average Wait Time (minutes)')
    return(plot)
}

# Main function to automate the wait times report generation
generate_report <- function(file_path) {
    data <- load_data(file_path)
    analysis <- analyze_wait_times(data)
    plot <- create_visualizations(analysis)
    # Save plot
    ggsave('wait_times_plot.png', plot)
    # Write analysis results to CSV
    write_csv(analysis, 'wait_times_analysis.csv')
}

# Example usage
# generate_report('path_to_hospital_wait_times_data.csv')

