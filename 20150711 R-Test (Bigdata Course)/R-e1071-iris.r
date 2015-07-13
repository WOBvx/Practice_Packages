##Uncomment if use this package for the first time
##install.packages("e1071");   
library("e1071");
data(iris);
n<-nrow(iris);
idx<-sample(1:n, floor(n/2), replace=FALSE);
iris_train<-iris[idx,]; iris_test<-iris[-idx,];
myiris<-svm(Species ~ ., data=iris_train, method="C-classifi
cation", kernel="linear", cost=10, gamma=0.01);
summary(myiris);
myiris_pred<-predict(myiris, iris_test, decision.values=TRUE)
conf<-table(myiris_pred,iris_test$Species);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");