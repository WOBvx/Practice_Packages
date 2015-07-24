##Uncomment if use this package for the first time
##install.packages("tree");
library(tree);
data(iris);
n<-nrow(iris);
idx<-sample(1:n, floor(n/2), replace=FALSE);
iris_train<-iris[idx,]; iris_test<-iris[-idx,];
labels<-class.ind(iris$Species);
myiris<-tree(Species ~ ., data=iris_train);

summary(myiris)

##R Code on the Iris data(test)
test.cl <- function(true, pred) {
true <- max.col(true)
cres <- max.col(pred)
table(true, cres)
}
conf<-test.cl(labels[-idx,], predict(myiris, iris_test));
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");