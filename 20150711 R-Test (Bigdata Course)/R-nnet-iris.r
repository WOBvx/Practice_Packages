library(nnet);
data(iris);
n<-nrow(iris);
labels <-class.ind(c(rep("s",50), rep("c",50), rep("v",50)));
idx<-sample(1:n, floor(n/2), replace=FALSE);
iris_train<-iris[idx,1:4]; iris_test<-iris[-idx,1:4];
myiris<-nnet(iris_train, labels[idx,],
size=4, rang=0.1,
decay=5e-4, maxit=200);

test.cl <- function(true, pred) {
true <- max.col(true)
cres <- max.col(pred)
table(true, cres)
}
conf<-test.cl(labels[-idx,], predict(myiris, iris_test));
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");

iris<-sample(1:n,)