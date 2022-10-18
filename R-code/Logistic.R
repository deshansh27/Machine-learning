#Import the data
datasets=read.csv("C:\\Users\\desha\\Desktop\\data science programming\\winequality-red (1).csv",sep=";")
View(datasets)

#datasets
dim(datasets)
str(datasets)

datasets$quality=ifelse(datasets$quality>5,1,0)
plot(datasets)

colSums(is.na(datasets))

#encoding categorical variable
datasets$quality=factor(datasets$quality,levels=c(0,1))
str(datasets)

#splitting the data
#install.packages('caTools')
library(caTools)
set.seed(145)
split1=sample.split(Y=datasets$quality,SplitRatio=0.8)
training_set=subset(x=datasets,split1==TRUE)
testing_set=subset(x=datasets,split1==FALSE)

#Feature Scaling
training_set[-12]=scale(training_set[-12])
testing_set[-12]=scale(testing_set[-12])

#fitting a mode
classifier=glm(formula=quality~.,family=binomial(),data=training_set)
summary(classifier)

#predicting
y_pred=predict(object=classifier,type='response',newdata=testing_set)
y_pred=ifelse(y_pred>0.5,1,0)

#confusion matrix
cm=table(testing_set[,12],y_pred)
cm
sum(diag(cm))/sum(cm)