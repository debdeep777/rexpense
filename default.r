# Exclude variable
excludevar <- c("Income","Bill")
# Include variable
includevar <- vector()
# Single person mode
singleperson <- FALSE
# From a specific date
fromdate <- 0
# From a specific date
todate <- 0


## For giter.r
# Weekly data or monthly data
# edited
timespan <- "month"
# legend format
legformat <- "%y %b"
# Plot side by side or not
besideval <- FALSE
# budget line
addline <- FALSE
# Show number on top of bars
shownum <- FALSE
# Populate data with empty values
# changed
populate <- TRUE

# For plot.r
xvar <- "timeS"
xvarmod <- FALSE
yvar <- "Amount"
yvarmod <- FALSE
fillvar <- "Category"
fill <- FALSE
facetvar <- "User"
facet <- FALSE
showval <- FALSE
shadow <- FALSE

# Taking args
if(length(args) !=0){
	# date filter
	if("from" %in% args){
		startingdate <- TRUE
		fromdate <- c(args[match("from",args)+1])
		today <- Sys.Date()
		if(fromdate == "thisweek"){
			fromdate <- cut(today, breaks="week")
		} else if ( fromdate == "thismonth"){
			fromdate <- cut(today, breaks="month")
		} else if ( fromdate == "thisyear"){
			fromdate <- cut(today, breaks="year")
		} else if ( fromdate == "lastweek"){
			#week of 7 days ago
			ld <- seq.Date(today,by="-1 week", length=2)[2]
			fromdate <- cut(ld, breaks="week")
		} else if ( fromdate == "lastmonth"){
			#week of 7 days ago
			ld <- seq.Date(today,by="-1 month", length=2)[2]
			fromdate <- cut(ld, breaks="month")
		} 
		# cut gives you a data, not a date, so we need to convert
		fromdate <- as.Date(fromdate, format="%Y-%m-%d")
	}
	if("to" %in% args){
		startingdate <- TRUE
		todate <- c(args[match("to",args)+1])
		today <- Sys.Date()
		if(todate == "thisweek"){
			todate <- cut(today, breaks="week")
		} else if ( todate == "thismonth"){
			todate <- cut(today, breaks="month")
		} else if ( todate == "thisyear"){
			todate <- cut(today, breaks="year")
		} 
		# cut gives you a data, not a date, so we need to convert
		todate <- as.Date(todate, format="%Y-%m-%d")

	}
	# user filter
	if("person" %in% args){
		# A category name must follow after person
		personname <- c(args[match("person",args)+1])
		if(personname != 'all'){	
			singleperson <- TRUE
		}
	}

	# Category filter
	if("no" %in% args){
		# match(vector, string) returns only FIRST matching place
		# which( string %in% vector) returns all, order of writing is opposite
		excludevar <- c(args[which(args %in% "no")+1])
	}
	# Only has precedence over no
	if("only" %in% args){
		# match(vector, string) returns only FIRST matching place
		# which( string %in% vector) returns all, order of writing is opposite
		includevar <- c(args[which(args %in% "only")+1])
	}

# Plot filters
	if("xvar" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				xvar <- c(args[which(args %in% "xvar")+1])
				xvarmod <- TRUE
		}
	if("yvar" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				yvar <- c(args[which(args %in% "yvar")+1])
				yvarmod <- TRUE
		}

	if("fillvar" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				fillvar <- c(args[which(args %in% "fillvar")+1])
				fill <- TRUE
		}
	if("facetvar" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				facetvar <- c(args[which(args %in% "facetvar")+1])
				facet <- TRUE
		}
	
	if("shadow" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				shadow <- TRUE 
		}

	if("showval" %in% args){
				# match(vector, string) returns only FIRST matching place
				# which( string %in% vector) returns all, order of writing is opposite
				showval <- TRUE 
		}
# Problem with populate code!

	#timespan selection
	if("month" %in% args){
		timespan <- "month"
		legformat <- "%y %b"
	}
	if("week" %in% args){
		timespan <- "week"
		legformat <- "%y %b %d"
	}
	if("year" %in% args){
		timespan <- "year"
		legformat <- "%y"
	}
	if("day" %in% args){
		timespan <- "day"
		legformat <- "%b %d"
	}

	# side by side
	if("beside" %in% args){
		besideval <- TRUE
	}
	# budget line with default
	if("budget" %in% args){
		addline <- TRUE
		bamount <- as.numeric(c(args[match("budget",args)+1]))
		# If the string after budget is non-numeric, set is to default value

		if ( (is.numeric(bamount) == FALSE) || is.na(bamount) ){
			bamount <- 100
		}	
	}
	if("number" %in% args){
		shownum <- TRUE
	}
}

