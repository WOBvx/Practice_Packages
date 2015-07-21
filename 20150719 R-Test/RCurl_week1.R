#1
library("RCurl")
url.exists("http://www.ylzinfo.com")

#2 配置 RCurl 中的 Debug
d=debugGatherer()
temp <- getURL("http://www.ylzinfo.com",debugfunction=d$update,verbose= TRUE)
cat(d$value()[3]) #提交给服务器的头信息
cat(d$value()[1]) #服务器地址及端口号
cat(d$value()[2]) #服务器返回的头信息

#3 获得 Header
h = basicHeaderGatherer()
txtt=getURL("http://www.dataguru.cn" , headerfunction = h$update )
names(h$value())
h$value()

#4 获得句柄
curl = getCurlHandle()
d = getURL("http://www.dataguru.cn/",curl=curl)
names(getCurlInfo(curl))
getCurlInfo(curl)$response.code

#5
myheader <- c(
"Accept:*/*",
"Accept-Encoding:gzip, deflate, sdch",
"Accept-Language:zh-CN,zh;q=0.8",
"Connection:keep-alive",
"User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) KFC/39.0.2171.99 Safari/537.36 LBBROWSER"
)
#进行报头伪装
temp = getURL("http://www.baidu.com",httpheader = myheader)
#检验伪装
d = debugGatherer()
temp1 = getURL("http://www.baidu.com",httpheader = myheader, debugfunction=d$update , verbose = TRUE)
cat(d$value()[3]) #提交给服务器的头信息