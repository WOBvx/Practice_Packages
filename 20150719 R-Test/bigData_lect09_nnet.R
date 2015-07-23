Nums <- 10:20
n <- length(Nums)
idx <- sample(1:n,floor(n/2))
# idx从所有数（10）中随机抽样一半（5）
Nums[idx]
# 随机抽样 5 个数
Nums[-idx]
# 抽取剩余的 5 个数，若Nums[idx]不是取一半而是取 1 个数，Nums[-idx]则显示 9 个。


#####

labels <-class.ind(c(rep("s",50), rep("c",50), rep("v",50)));
#class.ind 是 nnet包中的函数，Generates Class Indicator Matrix from a Factor
#从因素生成类指标矩阵
#rep是复制，rep(x,times),c()生成数组
a <- c(rep("s",10),rep("v",10))
b <- class.ind(a)
#可以对比，a 为数组，b 为矩阵

myiris<-nnet(iris_train, labels[idx,],
size=2, rang=0.1,
decay=5e-4, maxit=200);
#size 为隐层数
#rang 初始随机权重,除非 input 非常大，不然初始一般设置为 0.5
#decay parameter for weight decay. Default 0.权重衰减，5e-4意思为5x10^(-4),0.0005
#maxit 迭代次数
#此次试验的几个值和help(nnet)的相一致

