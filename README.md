Coursera - Getting and Cleaning Data - Course Project
==============================================
Author: Luiz Claudio D. M. F. Boechat
----------------------------------------------

This repository contains all code necessary to solve the problem present by the Course Project from the Coursera's course "Getting and Cleaning Data".

The solution is formed by two scripts:
* **run_analysis.R** - contains all code necessary to read raw data files and to generate the required data sets. It uses a function defined in **getRawDataFiles.R** for checking if the raw data files exist;
* **getRawDataFiles.R** - contains a function that is used by "run_analysis.R" that certifies that the working directory contains the necessary files. The raw data files are downloaded and unzipped from a package if they do not exist in the working directory.

Running the solution requires only to load the script **run_analysis.R** using the command below:
```{r}
source("run_analysis.R")
```

