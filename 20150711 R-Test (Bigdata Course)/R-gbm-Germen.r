##The German Credit data
##install.packages("gbm");
library(gbm);
x <- read.table("german.Data",header=FALSE,sep="");
n <- nrow(x); p<-ncol(x);
x[x[,p]==2,p]<-0;
colnames(x)[p]<-"class";
idx2<-sample(1:n,floor(n/2), replace=FALSE);
xtrain<-x[idx2,]; xtest<-x[-idx2,];
mygbm<-gbm(class ~.,
distribution = "adaboost",
data = xtrain, n.trees = 1000,
interaction.depth = 1, n.minobsinnode = 10,
shrinkage = 0.01, bag.fraction = 0.5,
train.fraction = 5/12);
NTREE<-gbm.perf(mygbm);
tmp<-predict(mygbm,xtest, n.trees=NTREE, type="response");
mypred<-tmp;
mypred[tmp>0.5]<-1; mypred[tmp<0.5]<-0;
conf<-table(mypred,xtest$class);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");
