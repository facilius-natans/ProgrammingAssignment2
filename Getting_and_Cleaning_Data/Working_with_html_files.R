library("XML")
# read in HTML code lines

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)

# Close connection
close(con)

# Count number of characters in lines 10, 20, 30, 100
result <- nchar(c(htmlCode[10], htmlCode[20], htmlCode[30], htmlCode[100]))
print(result)
