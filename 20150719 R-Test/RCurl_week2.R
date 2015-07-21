library("RCurl")

#1 读取文件列表
url="ftp://ftp.wcc.nrcs.usda.gov/data/snow/snow_course/table/history/idaho/"
filename = getURL(url,dirlistonly=TRUE) # <-- here
ls(filename)
print("hello")

#2 跳转重定向
curl = getCurlHandle()
destination =  getURL("http://www.sina.com",curl=curl,followlocation=T) #<--here，返回200，否则301
getCurlInfo(curl)$response.code

#3 Week2 13min