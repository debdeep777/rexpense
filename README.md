# rexpense
Expense reporting using R

# Description
Provided we have a expense data which is suitable categorised, we can filter it using parameters and generate various plots.
Useful when multiple users are adding data to the same files.
* There is a dummy data file `data/usable.csv` which will be used in this case
* The data file is a csv with the following format:
"Date", "Amount", "Description", "Category", "User"
* Date is in the format "%Y-%m-%d"
* Amount is numeric
* Description, Category and User are characters

# Requirement
* R
* ggplot2

# Usage
`Rscript rexpense.r <parameters>`
Or, for older implementation.
`Rscripts gen.r <parameters>`

# Parameters
* Timespan: `day | week | month | year`
* Only certain Categories: `only Category1 | Category2 | ...| Categoryn`
* Exclude Categories:      `no   Category1 | Category2 | ...| Categoryn`
* Date filters: `from | to  <Date in "%Y-%m-%d">`
* As x axis: `xval <datesymbol> | <data.variable>`, usually `timeS`
* As y axis: `yval <datesymbol> | <data.variable>`, usually `Amount`
* Denote separation using color: `fillvar <datesymbol> | <data.variable>`, usually `Category`
* Separate pictures under same axis convention (facet-wrap): `facetvat <datesymbol> | <data.variable>`, usually `User`
* Show value of all entries: `showval`, ugly for now

# Files generate
* Plot: `data/ggplot.csv`
* Filtered data in csv: `data/filtered.csv`

# Sample
The following image was created using: 
`Rscript rexpense.r facetvar Category fillvar User month`
![alt tag](https://github.com/debdeep777/rexpense/blob/master/data/ggplot.png)


