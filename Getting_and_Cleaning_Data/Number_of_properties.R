download.file(fileUrl, destfile = "getdata%2Fdata%2Fss06hid.csv")

# Read file
file <- read.csv("getdata%2Fdata%2Fss06hid.csv", header = TRUE)

# Examine the structure of the file
str(file)

# Extract column with property values
cost <- file[ , "VAL"]

# Remove missing values - NAs
cost <- na.omit(cost)

# Find how many properties are worth $!000000+, which corresponds to 24 in the column "VAL"
# Use "sum" function to add all TRUE values
prop_greater_than_million <- sum(cost == 24)
a <- prop_greater_than_million
print(a)

