Nums <- 10:20
n <- length(Nums)
idx <- sample(1:n,floor(n/2))
# idx����������10�����������һ�루5��
Nums[idx]
# ������� 5 ����
Nums[-idx]
# ��ȡʣ��� 5 ��������Nums[idx]����ȡһ�����ȡ 1 ������Nums[-idx]����ʾ 9 ����


#####

labels <-class.ind(c(rep("s",50), rep("c",50), rep("v",50)));
#class.ind �� nnet���еĺ�����Generates Class Indicator Matrix from a Factor
#������������ָ�����
#rep�Ǹ��ƣ�rep(x,times),c()��������
a <- c(rep("s",10),rep("v",10))
b <- class.ind(a)
#���ԶԱȣ�a Ϊ���飬b Ϊ����

myiris<-nnet(iris_train, labels[idx,],
size=2, rang=0.1,
decay=5e-4, maxit=200);
#size Ϊ������
#rang ��ʼ���Ȩ��,���� input �ǳ��󣬲�Ȼ��ʼһ������Ϊ 0.5
#decay parameter for weight decay. Default 0.Ȩ��˥����5e-4��˼Ϊ5x10^(-4),0.0005
#maxit ��������
#�˴�����ļ���ֵ��help(nnet)����һ��

summary(myiris)
#���ջ���ѧϰ�����Ķ���
#���ԵĹ��̣���ΪӦ�ù���