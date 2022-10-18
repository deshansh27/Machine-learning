#import dataset
dataset=read.csv("C:\\Users\\desha\\Desktop\\DATA WAREHOUSE\\lab\\Data_binary_R.csv")
View(dataset)

#install packages
install.packages('arules')
library('arules')

#Checking the data
data=read.csv("C:\\Users\\desha\\Desktop\\DATA WAREHOUSE\\lab\\Data_binary_R.csv",header=T,
              colClasses='factor')
data
data=data[,-1]
summary(data)
View(data)
length(data)
dim(data)
class(data)
str(data)

#Rule generation- overriding minsup and mincof
rules=apriori(data)   #default support and confidence
inspect(rules)
rules=apriori(data,parameter=list(supp=0.4,conf=0.7,target='r'))   # using our own minsup and min conf
inspect(rules)

#remove menaingless rules
rules=apriori(data,parameter=list(minlen=2,maxlen=6,supp=0.4,conf=0.7,target='r'))  # removing nullset which have no meaning
inspect(rules)

rules=apriori(data,parameter=list(supp=0.4,conf=0.7,target='r'),
              appearance = list(none=c('Beer=NO','Bread=NO','Butter=NO',
                                       'Cookies=NO','Diaper=NO','Milk=NO')))  # remove all rules with no item purchased
inspect(rules)

#rule generation lhs and rhs
rules=apriori(data,parameter=list(supp=0.4,conf=0.7,target='r'),
              appearance = list(none=c('Beer=NO','Bread=NO','Butter=NO',
                                       'Cookies=NO','Diaper=NO','Milk=NO'),lhs=c('Bread=YES','Milk=YES')))
inspect(rules)

rules=apriori(data,parameter=list(supp=0.4,conf=0.7,target='r'),
              appearance = list(none=c('Beer=NO','Bread=NO','Butter=NO',
                                       'Cookies=NO','Diaper=NO','Milk=NO'),lhs=c('Butter=YES'),rhs=c('Bread=YES')))
inspect(rules)


