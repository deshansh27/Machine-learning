#import dataset
iris_set2=datasets::iris
View(iris_set2)
iris_set2<-iris[,-5]

#dendrogram to know the number of clusters
install.packages('clusters')
library(cluster)
dendrogram=hclust(d=dist(x=iris_set2,method='euclidean'),method="ward.D")
main=paste("made by 20MID0072")
plot(dendrogram)

#fitting
y_pred=hclust(d=dist(x=iris_set2,method='euclidean'),method="ward.D")
y_heirarchy=cutree(y_pred,5)

#Visualization
clusplot(x=iris_set2,y_heirarchy,main="Made by 20MID0072",xlab="Length",ylab="Height")

