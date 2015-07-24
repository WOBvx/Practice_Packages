##The spam data
##install.packages("gbm");
library(gbm);
x<-read.table("spam.Data",sep=",");
n<-nrow(x); p<-ncol(x);
colnames(x)[p]<-"class";
##Split the data according to HTF for comparison
T<-3065;
idx2<-sample(1:n,T, replace=FALSE);
xtrain<-x[idx2,]; xtest<-x[-idx2,];
mygbm<-gbm(class ~.,
distribution = "adaboost",
data = xtrain,
n.trees = 2000,
n.minobsinnode = 10,
shrinkage = 0.01,
bag.fraction = 0.5, train.fraction = 3/12);
NTREE<-gbm.perf(mygbm);
mypred<-predict(mygbm,xtest, n.trees=NTREE, type="response");
mypred[mypred>0.5]<-1; mypred[mypred<0.5]<-0;
conf<-table(mypred, xtest$class);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");

print(mygbm);
table(mypred,xtest$class)