x <- c(1, 5, 8, 9, 1, 0, 15, 15)
y <- x[1:8]
z <- x[x == 1]
b <- sum(z)
print(b)
a <- sum(y > 5)
print(a)
c <- a + b
print(c)
