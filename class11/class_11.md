---
title: "class 11"
author: "Miso Lee"
date: "May 8, 2018"
output: 
  html_document: 
    keep_md: yes
---



## PDB statistics

Download CSV file from PDB database <http://www.rcsb.org/stats/summary>. Read this into R and deterine fraction of X-ray structures.


```r
pdb.stats <- read.csv("Data Export Summary.csv")
```

Lets caclulate something


```r
percent <- (pdb.stats$Total / sum(pdb.stats$Total)) * 100
names(percent) <- pdb.stats$Experimental.Method
percent
```

```
##               X-Ray                 NMR Electron Microscopy 
##         89.51253323          8.72181096          1.50770286 
##               Other        Multi Method 
##          0.17006317          0.08788979
```

