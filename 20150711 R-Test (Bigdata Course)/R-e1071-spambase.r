##https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/  // <-- "spambase.Data" From here
##Uncomment if use this package for the first time
##install.packages("e1071");   
library("e1071");
x<-read.table("spambase.Data",sep=",");
n<-nrow(x); p<-ncol(x);
x[,p]<-as.factor(x[,p]); colnames(x)[p]<-"class";
##Split the data according to HTF for comparison
T<-3065;
idx2<-sample(1:n,T, replace=FALSE);
spam_train<-x[idx2,]; spam_test<-x[-idx2,];
spam_tune<-tune.svm(class ~., data=spam_train[1:500,],
gamma=10^(-6:-3),cost=10^(1:2));
summary(spam_tune);

myGamma<-spam_tune$best.parameters[[1]];
myC<-spam_tune$best.parameters[[2]];
myspam<-svm(class ~ ., data=spam_train,cost=myC, gamma=myGamma,
cross=10, method = "C-classification");
summary(myspam);
myspam_pred<-predict(myspam,spam_test,decision.values=TRUE);
conf<-table(myspam_pred,spam_test$class);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");