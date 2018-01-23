# rexpense
Expense reporting using R for a multi-user setup

# Description
Provided we have an expense data which is suitable categorised, we can filter it using parameters and generate various plots.
Useful when multiple users are adding data to the same file.
* There is a dummy data file `data/usable.csv` which will be used in this case
* The data file is a csv with the following format:
"Date", "Amount", "Description", "Category", "User"
* Date is in the format "%Y-%m-%d"
* Amount is numeric
* Description, Category and User are characters and surrounded by quotes

# Requirement
* R
* ggplot2
* A csv file `data/usable.csv` appropriately structured (see above)

# Usage
`Rscript rexpense.r <parameters>`

# Parameters
* Timespan: `day | week | month | year`
* Only certain Categories: `only Category_1 | Category_2 | ...| Category_n` where `Category_i` is one of the `Category` in the csv file.
Can be used multiple times to include multiple categories.
* Exclude Categories:      `no   Category1 | Category2 | ...| Categoryn`. 
Can be used multiple times.
* Date filters: `from | to  <Date in "%Y-%m-%d" | date_string>`. 
`<date_string>` can be: `thisweek`, `thismonth`, `thisyear` to denote starting date or ending date, if used with `from` or `to` respectively. 
Additional `<date_string>` that can be used with `from`: `lastweek`, `lastmonth`.
* Only one user: `person User1 | User2 | ... | Usern`
* As x axis: `xvar <variable_label>`, default is `timeS` (`timeS` is day/week/month/year, whatever is specified before). 
Possible `<variable_label>`: `timeS | User | Category | Amount | Description` and format strings: ` a | A | m | y | d` for ( short week | week | month | year | day)
* As y axis: `yvar <variable_label>`, default is `Amount`. Same `<variable_label>` are allowed as in `xval`
* Denote separation using color: `fillvar <variable_label>`, usually `Category`
* To show separate bar graph next to each other: `beside`
* Separate pictures under same axis convention (facet-wrap): `facetvat <variable_label>`, usually `User`
* Add a budget line with `budget <numerical value>`
* To show number: `number`
* Show value of all entries: `showval`, ugly for now; `shoadow` not functional
* `default.r` is related to all the parameters

# Files generated
* Plot: `data/ggplot.csv`
* Filtered data in csv: `data/filtered.csv`

# Sample
The following image was created using: 
`Rscript rexpense.r facetvar Category fillvar User month`
![alt tag](https://github.com/debdeep777/rexpense/blob/master/data/ggplot.png)

# Other examples
* `Rscript rexpense only Category3 xvar User yvar Amount` (Which user spends more for Category3?)
* `Rscript rexpense.r xvar User yvar Category fillvar Category` (Which user spends how much on which category?)
* `Rscript rexpense.r xvar a yvar User fillar user` (Who spends more on which weekday?)
* `Rscript rexpense.r xvar a only Category2 fillvar user` (Which month had most spending on Category2, user-wise?)


