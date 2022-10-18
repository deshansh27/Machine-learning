#install packages
install.packages('clusters')
library(cluster)
iris_set=datasets::iris
View(iris_set)
iris_set<-iris[,-5]
View(iris_set)

#setting the seed
set.seed(145)

kmeans.re<-kmeans(iris_set,centers=,nstart = 20)
kmeans.re
kmeans.re$cluster

#confusion matrix
cm<-table(iris$Species,kmeans.re$cluster)
cm

#visualization and evaluation
plot(iris_set[c("Sepal.Length","Sepal.Width")])
plot(iris_set[c("Sepal.Length","Sepal.Width")],col=kmeans.re$cluster)
plot(iris_set[c("Sepal.Length","Sepal.Width")],col=kmeans.re$cluster,main="K-means having 3 clusters")

#plot centre of cluster
kmeans.re$centers
kmeans.re$centers[,c("Sepal.Length","Sepal.Width")]


points(kmeans.re$centers[,c("Sepal.Length","Sepal.Width")],col=1:3,pch=8,cex=3)

#Visualizing clusters
y_kmeans<-kmeans.re$cluster
clusplot(iris_set[,c("Sepal.Length","Sepal.Width")],y_kmeans,lines=2,shade=TRUE,color=TRUE,plotchar = F,span = TRUE,
main=paste(xlab="Sepal.Length",ylab="Sepal.Width")

