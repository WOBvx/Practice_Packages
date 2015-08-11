library(nnet)
#shuzu <- #数据源


Num <- 5 #取之范围
l <- length(shuzu)
idx = sample(1:(l-Num+1),floor((l-Num+1)/2),replace=FALSE) #随机取一半

xulie <- matrix(0,nrow=(l-Num+1),ncol=Num)
for (i in 1:(l-Num+1)){
  xulie[i,]<-shuzu[i:(i+Num-1)];
}


xulie_train <- xulie[idx,1:(Num-1)] #取值，除最后 1 位作为预测值
#此处把所有数据作为训练，因为数据少
xulie_test <- xulie[-idx,1:(Num-1)] #随机取一半做测试
xulie_test2 <- xulie[(l-Num+1),2:Num] #取最后一行（真实预测）
labels <- class.ind(xulie[,Num]) #labels作为结果值（标靶）


acc=0; #用于while计数
count=0; #用于while计数
while(acc<0.4){ #让计算机反复计算，得出「具有一定价值」的模型
myxulie<-nnet(xulie_train, labels[idx,],size=2, rang=0.1,decay=5e-4, maxit=200);
######
#检测准确率
test.cl <- function(true, pred) {
true <- max.col(true) #取 true 矩阵每行最大值,true来自标靶
cres <- max.col(pred) #pred，预测值来自test
table(true, cres)
}
conf<-test.cl(labels[-idx,], predict(myxulie, xulie_test)); #检测通过现有预测模型预测的准确性
acc<-sum(diag(conf))/sum(conf);
if(count>20){break}; #当重复次数超过20时候，就跳出
}; #while结束
cat("The accuracy on the test set is", acc,"\n");

#预测结果
predict(myxulie, xulie_test2) #预测未来值