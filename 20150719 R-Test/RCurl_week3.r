# 替换
mychar = "dataguru"
chartr = （"u","r",mychar）

# 连接
list=c("data","guru","RCurl")
paste("data","guru",sep="-") #sep是连接符
paste(list,collapse="-")

# 截取
substr(mychar,1,4)

# 交集并集
union(mychar,list)
intersect(mychar,list)