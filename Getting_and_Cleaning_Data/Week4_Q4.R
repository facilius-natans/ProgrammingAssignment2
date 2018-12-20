
# Download into R
gdp <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                         , skip=5
                         , nrows = 190
                         , select = c(1, 2, 4, 5)
                         , col.names=c("CountryCode", "Rank", "Economy", "Total"))
# print(head(gdp))

# Download into R
edu <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv') 
# print(head(edu))

combined <- merge(gdp, edu, by = 'CountryCode')
print(nrow(combined))

countries_with_fiscal_year <- grep("^Fiscal year end: June", combined$"Special Notes")
print(countries_with_fiscal_year)