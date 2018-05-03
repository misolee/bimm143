---
title: "Bioinformatics Class7"
author: "Miso Lee"
date: "April 24, 2018"
output: 
  html_document: 
    keep_md: yes
---



## Functions again

Here I am going to revisit our function from class6


```r
source("http://tinyurl.com/rescale-R")
```

Let's see if we can use this function


```r
rescale(1:10)
```

```
##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
##  [8] 0.7777778 0.8888889 1.0000000
```

Looks good let's break it!


```r
# rescale( c(1:10, "string") )
```

Let's try the new **rescale2()** function


```r
# rescale2( c(1:10, "string") )
```

## Write a NA checking function

Here we write a new function to check for NAs in two inputs


```r
x <- c(1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3, 4)

# is.na(x)
```


```r
which(is.na(x))
```

```
## [1] 3 5
```

```r
which(is.na(y))
```

```
## [1] 1 3
```


```r
sum (is.na(x))
```

```
## [1] 2
```

Let's put this together with `x` and `y`


```r
is.na(x)
```

```
## [1] FALSE FALSE  TRUE FALSE  TRUE
```

```r
is.na(y)
```

```
## [1]  TRUE FALSE  TRUE FALSE FALSE
```


```r
is.na(x) & is.na(y)
```

```
## [1] FALSE FALSE  TRUE FALSE FALSE
```



```r
sum(is.na(x) & is.na(y))
```

```
## [1] 1
```

This is the both_na() function starting point


```r
both_na <- function(x,y) {
  sum(is.na(x) & is.na(y))
}
```

Test it


```r
both_na(x,y)
```

```
## [1] 1
```

and again


```r
x <- c(NA, NA, NA)
y1 <- c(1, NA, NA)
y2 <- c(1, NA, NA, NA)

both_na(x,y2)
```

```
## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
## shorter object length
```

```
## [1] 3
```

Use stop() inside function to catch this case


```r
both_na2 <- function(x,y) {
  if(length(x) != length(y)) {
    stop("Input x and y should be the same length")
  }
  sum(is.na(x), is.na(y))
}
```


# paste(c("R is", "hard"))
# [1] "R is" "hard"
# > paste(c("R is", "hard"), collapse = " ")
# [1] "R is hard"

Try the both_na3() function


```r
both_na3 <- function(x, y) {
 if(length(x) != length(y)) {
 stop("Input x and y should be vectors of the same length")
 }

 na.in.both <- ( is.na(x) & is.na(y) )
 na.number <- sum(na.in.both)
 na.which <- which(na.in.both)
 message("Found ", na.number, " NA's at position(s):",
 paste(na.which, collapse=", ") )

 return( list(number=na.number, which=na.which) )
}
```

## ANother function example: gene intersection


```r
df1
```

```
##     IDs exp
## 1 gene1   2
## 2 gene2   1
## 3 gene3   1
```

```r
df2
```

```
##     IDs exp
## 1 gene2  -2
## 2 gene4  NA
## 3 gene3   1
## 4 gene5   2
```

```r
x <- df1$IDs
y <- df2$IDs
```


```r
x
```

```
## [1] "gene1" "gene2" "gene3"
```

```r
y
```

```
## [1] "gene2" "gene4" "gene3" "gene5"
```


```r
# intersect (x,y)

x %in% y
```

```
## [1] FALSE  TRUE  TRUE
```


```r
y %in% x
```

```
## [1]  TRUE FALSE  TRUE FALSE
```

Now we can access the genes we want with these 'indices'


```r
x[x %in% y]
```

```
## [1] "gene2" "gene3"
```

```r
y[y %in% x]
```

```
## [1] "gene2" "gene3"
```

Can make these columns of the same object with **cbind()**

```r
gene_intersect <- function(x,y) {
  cbind (x[x %in% y], y[y %in% x])
}
```


```r
gene_intersect(x,y)
```

```
##      [,1]    [,2]   
## [1,] "gene2" "gene2"
## [2,] "gene3" "gene3"
```

# Let's change to take input data frames


```r
gene_intersect2 <- function(df1, df2) {
 cbind( df1[ df1$IDs %in% df2$IDs, ],
 df2[ df2$IDs %in% df1$IDs, "exp"] )
}
```



```r
gene_intersect2(df1,df2)
```

```
##     IDs exp df2[df2$IDs %in% df1$IDs, "exp"]
## 2 gene2   1                               -2
## 3 gene3   1                                1
```

# Sourcing bioconductor package

```r
# source("https://bioconductor.org/biocLite.R")
```














