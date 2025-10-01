#Prepare data
library(readxl)
library(dplyr)
library(purrr)
library(writexl)

# Set the path to the directory containing Excel files
path_to_files <- "path/to/your/excel/files"

# List all Excel files in the directory
file_list <- list.files(path_to_files, pattern = "\\.xlsx$", full.names = TRUE)

# Function to read each Excel file and return as a data frame
read_excel_file <- function(file_path) {
  read_excel(file_path)
}

# Read all Excel files and combine them into one data frame
combined_data <- file_list %>%
  map_df(~ read_excel_file(.))

# Optionally, you can view the combined data frame
print(combined_data)

# Write the combined data frame to a new Excel file
write_xlsx(combined_data, "Combined_Excel_Files.xlsx")
