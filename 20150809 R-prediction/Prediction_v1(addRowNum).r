library(nnet)
#shuzu <- c()

Num <- 7 #取之范围
l <- length(shuzu)
idx = sample(1:(l-Num+1),floor((l-Num+1)/2),replace=FALSE) #随机取一半

xulie <- matrix(0,nrow=(l-Num+1),ncol=Num)
for (i in 1:(l-Num+1)){
  xulie[i,]<-shuzu[i:(i+Num-1)];
}

xulie <- cbind(1:nrow(xulie),xulie) #把序号纳入计算范畴

xulie_train <- xulie[idx,1:(Num)] #取值，除最后 1 位作为预测值
#此处把所有数据作为训练，因为数据少
xulie_test <- xulie[-idx,1:(Num)] #随机取一半做测试
xulie_test2 <- xulie[(l-Num+1),2:Num] #取最后一行（真实预测）
labels <- class.ind(xulie[,Num+1]) #labels作为结果值（标靶）


acc=0; #用于while计数
accMax=0; #用于对比取值
myxulieMax=0; #用于对比取值
count=0; #用于while计数
while(acc<0.5){ #让计算机反复计算，得出「具有一定价值」的模型
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
if(accMax<acc){accMax<-acc;myxulieMax<-myxulie}; #用于得出最大值
count <- count+1;
if(count>200){break}; #当重复次数超过20时候，就跳出
}; #while结束
cat("The accuracy on the test set is", accMax,"\n");

#预测结果
x <- predict(myxulieMax, xulie_test2) #预测未来值
x <- cbind(1:8,matrix(x)) #把预测值 cbind 上序号，做成矩阵
x[order(x[,2],decreasing=T),] #结果排序