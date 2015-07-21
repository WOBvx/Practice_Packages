#1
library("RCurl")
url.exists("http://www.ylzinfo.com")

#2 ���� RCurl �е� Debug
d=debugGatherer()
temp <- getURL("http://www.ylzinfo.com",debugfunction=d$update,verbose= TRUE)
cat(d$value()[3]) #�ύ����������ͷ��Ϣ
cat(d$value()[1]) #��������ַ���˿ں�
cat(d$value()[2]) #���������ص�ͷ��Ϣ

#3 ��� Header
h = basicHeaderGatherer()
txtt=getURL("http://www.dataguru.cn" , headerfunction = h$update )
names(h$value())
h$value()

#4 ��þ��
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
#���б�ͷαװ
temp = getURL("http://www.baidu.com",httpheader = myheader)
#����αװ
d = debugGatherer()
temp1 = getURL("http://www.baidu.com",httpheader = myheader, debugfunction=d$update , verbose = TRUE)
cat(d$value()[3]) #�ύ����������ͷ��Ϣ