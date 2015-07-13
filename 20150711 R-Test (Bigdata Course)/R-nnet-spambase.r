##The spam data
x<-read.table("spambase.Data",sep=",");
n<-nrow(x); p<-ncol(x);
x[,p]<-as.factor(x[,p]);
##Split data according to HTF for comparison
T<-3065;
idx2<-sample(1:n,T, replace=FALSE);
spam_train<-x[idx2,1:(p-1)];
spam_test<-x[-idx2,1:(p-1)];
labels<-class.ind(x[,p]);
myspam<-nnet(spam_train, labels[idx2,],
size=2, rang=0.1,
decay=5e-4, maxit=200);

summary(myspam);
test.cl <- function(true, pred) {
true <- max.col(true)
cres <- max.col(pred)
table(true, cres)
}
conf<-test.cl(labels[-idx2,], predict(myspam, spam_test));
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");

