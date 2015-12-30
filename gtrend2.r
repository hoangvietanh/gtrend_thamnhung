if(!require(gtrendsR)) install.packages("gtrendsR")
library(gtrendsR)
library(reshape2)
library(ggplot2)
library(plotly)

usr <- ""  #put google user
psw <- "" #put google password
gconnect(usr, psw)
trend <- gtrends(c("tham nhũng"), res="week")


trend2=trend$trend #subset the trend data frame from the list
trend3=subset(trend2, as.Date(start) >= '2009-01-01') #subset for 2015


## Plotting data
tet <- c("2009-01-26","2010-02-14","2011-02-03","2012-01-23","2013-02-10","2014-01-31","2015-02-19")
tet=as.Date(tet)
ggplot(trend3, aes(x=start, y=tham.nhung)) + geom_line() + geom_vline(xintercept=as.numeric(as.Date(tet)),color="red")+ 
  ggtitle("Tần suất tìm kiếm từ khóa: tham nhũng ") + labs(x="Date",y="Interest index")
