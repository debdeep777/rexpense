library(ggplot2)

# Example plot
# xval	yval	fillvar	facetval
# m	Amount	Categ	y		
# a	Amount	Categ	m	from="thisyear"
createcol <- function(data, variable){
	if(variable %in% c("a","A", "m", "y", "d")){
		data[,variable] <- format(data$Date, format=paste0('%',variable))
		if( variable == "a"){
			data$a <- factor(data$a, levels=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))
		}
		if( variable == "A"){
			data$A <- factor(data$A, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
		}
		return (data)
	} else {
		return (data)
	}
}
if(xvarmod){
	tmp <- createcol(tmp, xvar)
}
if(yvarmod){
	tmp <- createcol(tmp, yvar)
}
if(fill){
	tmp <- createcol(tmp, fillvar)
}
if(facet){
	tmp <- createcol(tmp, facetvar)
}

# Print barplot
#fromdate <- as.Date("2016-12-31")
if(besideval){
	pl <- ggplot(tmp) + geom_bar(stat='identity', position='dodge') + aes_string(x=xvar, y=yvar) + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
} else {
pl <- ggplot(tmp) + geom_bar(stat='identity') + aes_string(x=xvar, y=yvar) + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
}

if(fill){
	pl <- pl + aes_string(fill=fillvar)
}
if(facet){
	#pl <- pl + facet_wrap(as.formula(paste("~", facetvar)), ncol=1)
	pl <- pl + facet_wrap(as.formula(paste("~", facetvar)))
}
if(showval){
	pl <- pl + aes(label=Amount) + geom_text(position = position_stack(vjust = 0.5))
}
if(shadow){
	pl <- pl + geom_bar(data=tmp[,setdiff(names(tmp), facetvar)], aes_string(xvar, yvar), stat='identity', alpha=I(0.2), fill='black')
}


# writing to file
# optimizing for mobile phone display
ggsave("data/ggplot.png", plot=pl, dpi=200)



