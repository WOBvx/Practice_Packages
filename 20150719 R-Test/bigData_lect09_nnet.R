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