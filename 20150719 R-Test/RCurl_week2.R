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

#3下载文件
temp <- getBinaryURL("http://www.circ.gov.cn/portals/0/attachments/xingzhengxuke/2008/bjcx1410.xls")
note <- file("hellodata.xls",open = "wb") # wb 来打开，
writeBin(temp,note) #用 WriteBin来写入
close(note)

#4 strsplite字符切分
Sys.time()
a <- strsplit(as.character(Sys.time())," ") #strsplit 只能切字符型，逗号后为自定义分割特征符
unlist(a)
unlist(a)[1]

#5 lappy().paste()
html = getURL("http://rfunction.com/code/1202/")

# XML
#2.1 抓取表单数据
library("RCurl")
library("XML")
url = "http://www.bioguo.org/AnimalTFDB/BrowseAllTF.php?spe=Mus_musculus"
wp <- getURL(url)
doc <- htmlParse(wp,asText= TRUE) #分析表格文本
tables <- readHTMLTable(doc) 
tables <- readHTMLTable(doc,which = 5)  #读取表格文档，which为表格中第几块
tables <- readHTMLTable(doc,header = F)  #不读取表格头

url = "http://www.csndmc.ac.cn/wdc4seis@bj/earthquakes/csn_quakes_p001.jsp"
wp <- getURL(url)
doc <- htmlParse(wp,asText = TRUE)
tables <- readHTMLTable(doc,header = F)  

#2.2 XPath,用于 XML 的操作语言
url="http://www.w3school.com.cn/example/xmle/books.xml"
doc <- xmlParse(url)
getNodeSet(doc,'/bookstore/book[1]')
getNodeSet(doc,'/bookstore/book[position()<3]')  #position 显示前两首
# / 选择根节点
# // 选择任意位置的某个节点
# @ 选择某个属性
getNodeSet(doc,'//title[@lang]') 

#2.3 抓取大众点评
myheader = c(
"Accept:image/webp,*/*;q=0.8",
"Accept-Language:zh-CN,zh;q=0.8",
"Connection:keep-alive",
"User-Agent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36 LBBROWSER"
)
url="http://t.dianping.com/xiamen"
temp <- getURL(url,httpheader=myheader) #如果此处没有伪装header，会返回302错误
write.table(temp,"temp.txt")
doc <- htmlParse(temp)



