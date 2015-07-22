tmp<-read.table(file="bankNote.Data", sep=",");
n<-nrow(tmp);
x<-matrix(0,n,ncol(tmp));
for(i in 1:ncol(tmp)) { x[,i]<-tmp[,i];}
idx<-sample(1:n, floor(n/2)); 
#sample随机取样，sample(1:10)为1~10随机取
#floor(10/2)为floor(5)，设定地板为5，只取5个
#还可以 x<-1:12,sample(x)，将数组x放入sample
#参数replace=T,可放回
xtr<-x[idx,]; xts<-x[-idx,];
mylogit<-glm(xtr[,5]~xtr[,1:4], family=binomial(link="logit"));
#glm 广义线性回归
b<-mylogit$coefficients;
logits<-matrix(0,nrow(xts),1);
for (i in 1:nrow(xts))
{
logits[i]<-b[1]+sum(xts[i,1:4]*b[2:5]);
}
logits<-exp(logits)/(1+exp(logits));
classDF <- data.frame(response = xts[,5],
predicted = round(logits,0))
xtabs(~ predicted + response, data = classDF)



x2 <- pi * 100^(-1:3)
round(x2, 3)
signif(x2, 3)