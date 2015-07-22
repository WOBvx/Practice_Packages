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

# round(x,digits=0)  默认digits = 0,用于显示数组,使得小数点后数字可控
# trunc只取整数数字，舍掉小数点后数字
# signif取原数最接近的精度数的个数数字，并保留digits数+1位小数