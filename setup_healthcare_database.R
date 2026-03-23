# setup_healthcare_database.R

# Load necessary libraries
library(RSQLite)
library(dplyr)

# Function to load CSV data into SQLite and perform initial checks
setup_healthcare_database <- function(db_name, csv_file) {
  # Connect to SQLite database
  con <- dbConnect(RSQLite::SQLite(), dbname = db_name)
  
  # Load CSV data
  healthcare_data <- read.csv(csv_file)
  
  # Create necessary tables
  dbWriteTable(con, "healthcare_data", healthcare_data, overwrite = TRUE)
  
  # Perform initial data quality checks
  data_quality_checks <- data.frame(
    Column = names(healthcare_data),
    Missing_Values = sapply(healthcare_data, function(x) sum(is.na(x))),
    Unique_Values = sapply(healthcare_data, function(x) length(unique(x)))
  )
  
  print(data_quality_checks)
  
  # Close the database connection
  dbDisconnect(con)
}

# Example of running the function
# setup_healthcare_database("healthcare.db", "data/healthcare_data.csv")
