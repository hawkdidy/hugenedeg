# hugenedeg

An R package for hugeneg 2.0 ST differential expression analysis. This is a continuation of my thesis project. I see this a little bit more
reausble and reproducable than a bunch of scripts. This package is still being developed.


##How to use the package.

The functions of this package have to be followed in certain steps. Each step will create variables in the global environment that will be used 
in the follow functions. This will be a short guide on the uses of the function.

The first step will be to use the `lonoan()` function. This functions loads, normalizes, and then annotates the data. 

```R
#set a path to where your data is located 
mydir <- "Your/directory"

lonoan(mydir) 

```
You can do a quality control check by plotting barplots and doing a clustering analysis. 
```R
qc(rawData, normData) 
```

The output of this function will be the variables rawData and normData. The `filterc()` function will then remove control probes and genes 
that do not change between time points.
```R
filterc(normData) 
```

After this you will want to fit the data to a linear model and shrink the variance using ebayes. This will be done automatically
using the `normfit()` function. 
```R
normfit(normData) 
```

You can then get your results summerized in a text file and a variable using the `results()` function.

```R
results(normData) 
```
