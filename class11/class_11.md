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

# Loading bio 3d

```r
library(bio3d)
```

# example

```r
example(plot.bio3d)
```

```
## 
## plt.b3> ## No test: 
## plt.b3> ##D # PDB server connection required - testing excluded
## plt.b3> ##D 
## plt.b3> ##D ## Plot of B-factor values along with secondary structure from PDB
## plt.b3> ##D pdb <- read.pdb( "1bg2" )
## plt.b3> ##D bfac <- pdb$atom[pdb$calpha,"b"]
## plt.b3> ##D plot.bio3d(bfac, sse=pdb, ylab="B-factor", col="gray")
## plt.b3> ##D points(bfac, typ="l")
## plt.b3> ## End(No test)
## plt.b3> 
## plt.b3> ## Not run: 
## plt.b3> ##D ## Use PDB residue numbers and include short secondary structure elements
## plt.b3> ##D plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=pdb, resno=pdb, ylab="B-factor",
## plt.b3> ##D   typ="l", lwd=1.5, col="blue", sse.min.length=0)
## plt.b3> ##D 
## plt.b3> ##D 
## plt.b3> ##D ## Calculate secondary structure using stride() or dssp()
## plt.b3> ##D #sse <- stride(pdb)
## plt.b3> ##D sse <- dssp(pdb)
## plt.b3> ##D 
## plt.b3> ##D ## Plot of B-factor values along with calculated secondary structure
## plt.b3> ##D plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=sse, ylab="B-factor", typ="l",
## plt.b3> ##D col="blue", lwd=2)
## plt.b3> ## End(Not run)
## plt.b3> 
## plt.b3> ## No test: 
## plt.b3> ##D # PDB server connection required - testing excluded
## plt.b3> ##D 
## plt.b3> ##D ## Plot 'aligned' data respecting gap positions
## plt.b3> ##D attach(transducin)
## plt.b3> ##D 
## plt.b3> ##D pdb = read.pdb("1tnd") ## Reference PDB see: pdbs$id[1]
## plt.b3> ##D pdb = trim.pdb(pdb, inds=atom.select(pdb, chain="A"))
## plt.b3> ##D 
## plt.b3> ##D ## Plot of B-factor values with gaps
## plt.b3> ##D plot.bio3d(pdbs$b, resno=pdb, sse=pdb, ylab="B-factor")
## plt.b3> ##D 
## plt.b3> ##D ## Plot of B-factor values after removing all gaps 
## plt.b3> ##D plot.bio3d(pdbs$b, rm.gaps=TRUE, resno = pdb, sse=pdb, ylab="B-factor")
## plt.b3> ##D 
## plt.b3> ##D detach(transducin)
## plt.b3> ## End(No test)
## plt.b3> 
## plt.b3> ## Fancy secondary structure elements
## plt.b3> ##plot.bio3d(pdb$atom[pdb$calpha,"b"], sse=pdb, ssetype="fancy")
## plt.b3> ## Currently not implemented
## plt.b3> 
## plt.b3> 
## plt.b3>
```

# read 1hsg pdb file

```r
pdb <- read.pdb("1hsg")
```

```
##   Note: Accessing on-line PDB file
```

```r
pdb
```

```
## 
##  Call:  read.pdb(file = "1hsg")
## 
##    Total Models#: 1
##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
## 
##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
## 
##      Non-protein/nucleic Atoms#: 172  (residues: 128)
##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
## 
##    Protein sequence:
##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
##       VNIIGRNLLTQIGCTLNF
## 
## + attr: atom, xyz, seqres, helix, sheet,
##         calpha, remark, call
```

