# reshaping data following parameters
# Reading csv files
tran <- read.csv(filename, header=TRUE)

# Converting strings to dates if the format is known
# the default format of as.Date is "%Y-%m-%d"
tran$Date <- as.Date(tran$Date, format = "%Y-%m-%d")

# Applying date filter if any
if( fromdate > 0){	# works but need a better comparison 
	tran <- subset(tran, Date >= fromdate)
}
if( todate > 0){	# works but need a better comparison 
	tran <- subset(tran, Date <= todate)
}

# If a person is specified
if(singleperson){
	# Change Transaction.Type to Person
	tran <- subset(tran, User == personname)
}

# cats is the set of all categories
cats <- levels(tran$Category)
# If there are variables to exclude or include
if("only" %in% args){
	excludevar <- setdiff(cats,includevar)
}
cats <- setdiff(cats,excludevar)
#experimental
tran <- tran[tran[,"Category"] %in% cats,]

# Ordering the data w.r.t. date
tran <- tran[order(tran$Date, decreasing=TRUE),]

# this is where tran does not get modified anymore

# Write to file
write.csv(tran, "data/filtered.csv", row.names=FALSE)



# handling empty data
# Might appear somewhere else
# Need better handling
if (nrow(tran) == 0){
	stop("empty dataset")
	## should be starting date though
	#tran["Date"][1,1] <- Sys.Date()
	#tran[is.na(tran)] <- 0

}

# calling the data tmp instead of tran for no reason
tmp <- tran

# Most crucial step: assigning Month, Week etc to the data by crating a new frame variable
tmp$timeS <- as.Date(cut(tmp$Date, breaks = timespan))



