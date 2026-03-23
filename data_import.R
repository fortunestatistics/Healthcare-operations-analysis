# Load necessary libraries
library(tidyverse)

# Load the hospital wait times data
wait_times_data <- read.csv('path/to/hospital_wait_times.csv')

# Display the first few rows of the data
head(wait_times_data)

# Summary of the dataset
summary(wait_times_data)

# Check for missing values
sum(is.na(wait_times_data))
