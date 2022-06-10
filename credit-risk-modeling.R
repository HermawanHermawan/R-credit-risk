# load packages
library(gmodels)

# 1.Exploring the credit data

# importing the dataset
loan_data <- readRDS("data/loan_data_ch1.rds")
# View the structure of loan_data
str(loan_data)
# Call CrossTable() on loan_status to check the proportion of defaults
CrossTable(loan_data$loan_status)
# Call CrossTable() on grade and loan_status to calculate row-wise proportions
CrossTable(x=loan_data$grade, y=loan_data$loan_status, prop.r=TRUE, prop.c=FALSE, prop.t=FALSE, prop.chisq=FALSE)
# The table shows that the proportion of defaults increases when the credit rating moves from A to G

# Create histogram of loan_amnt
hist_1 <- hist(loan_data$loan_amnt, breaks = 200, xlab = "Loan amount", 
               main = "Histogram of the loan amount")

# Plot the age variable
plot(loan_data$age, ylab="Age")

# Save the outlier's index to index_highage
index_highage <- which(loan_data$age > 122)
index_highage

# Make bivariate scatterplot of age and annual income
plot(loan_data$age, loan_data$annual_inc, xlab = "Age", ylab = "Annual Income")

# Get indices of missing interest rates: na_index
na_index <- which(is.na(loan_data$int_rate))

# Compute the median of int_rate
median_ir <- median(loan_data$int_rate, na.rm=TRUE)

# Make copy of loan_data
loan_data_replace <- loan_data

# Replace missing interest rates with median
loan_data_replace$int_rate[na_index] <- median_ir

# Check if the NAs are gone
summary(loan_data_replace$int_rate)

# Set seed of 567
set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(loan_data), 2 / 3 * nrow(loan_data))

# Create training set: training_set
training_set <- loan_data[index_train, ]

# Create test set: test_set
test_set <- loan_data[-index_train, ]
