dataset=read.csv("C:\\Users\\desha\\Desktop\\Social_Network_Ads.csv")
View(dataset)

dataset=dataset[3:5]
View(dataset)
head(dataset)

str(dataset)
plot(dataset)

dataset$Purchased=factor(dataset$Purchased,levels=c(0,1))
str(dataset)

library(caTools)
set.seed(123)

#Splitting the dataset

split_2=sample.split(dataset$Purchased , SplitRatio = 0.75)
training_set=subset(dataset,split_2==TRUE)
test_set=subset(dataset,split_2==FALSE)

training_set[,-3]=scale(training_set[,-3])
test_set[,-3]=scale(test_set[,-3])
str(training_set)
View(training_set)

#fitting model
library(class)
y_predict=knn(train=training_set[,-3],test=test_set[,-3],cl=training_set[,3],k=5)

#confusion matrix
cm=table(test_set[,3],y_predict)
cm

#score
acc=sum(diag(cm))/sum(cm)
acc
