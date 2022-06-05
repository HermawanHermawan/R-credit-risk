# load packages
library(gmodels)

# Exploring the credit data

# importing the dataset
loan_data <- readRDS("loan_data_ch1.rds")
str(loan_data)
# View the structure of loan_data
str(loan_data)

# Call CrossTable() on loan_status to check the proportion of defaults
CrossTable(loan_data$loan_status)

# Call CrossTable() on grade and loan_status to calculate row-wise proportions
CrossTable(x=loan_data$grade, y=loan_data$loan_status, prop.r=TRUE, prop.c=FALSE, prop.t=FALSE, prop.chisq=FALSE)