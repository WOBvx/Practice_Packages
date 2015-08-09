library(nnet)
#shuzu <- #数据源

Num <- 5 #取之范围
l <- length(shuzu)
idx = sample(1:(l-Num+1),floor((l-Num+1)/2),replace=FALSE) #随机取一半

xulie <- matrix(0,nrow=(l-Num+1),ncol=Num)
for (i in 1:(l-Num+1)){
  xulie[i,]<-shuzu[i:(i+Num-1)];
}


xulie_train <- xulie[,1:(Num-1)] #取值，除最后 1 位作为预测值
#此处把所有数据作为训练，因为数据少
xulie_test <- xulie[idx,1:(Num-1)] #随机取一半做测试
xulie_test2 <- xulie[(l-Num+1),2:Num] #取最后一行（真实预测）
labels <- class.ind(xulie[,Num]) #labels作为结果值

myxulie<-nnet(xulie_train, labels,size=2, rang=0.1,decay=5e-4, maxit=200);

######
#检测准确率

test.cl <- function(true, pred) {
true <- max.col(true)
cres <- max.col(pred)
table(true, cres)
}
conf<-test.cl(labels[-idx,], predict(myxulie, xulie_test2));
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");

#预测结果
predict(myxulie, xulie_test2)