library("RCurl")

#1 ��ȡ�ļ��б�
url="ftp://ftp.wcc.nrcs.usda.gov/data/snow/snow_course/table/history/idaho/"
filename = getURL(url,dirlistonly=TRUE) # <-- here
ls(filename)
print("hello")

#2 ��ת�ض���
curl = getCurlHandle()
destination =  getURL("http://www.sina.com",curl=curl,followlocation=T) #<--here������200������301
getCurlInfo(curl)$response.code

#3�����ļ�
temp <- getBinaryURL("http://www.circ.gov.cn/portals/0/attachments/xingzhengxuke/2008/bjcx1410.xls")
note <- file("hellodata.xls",open = "wb") # wb ���򿪣�
writeBin(temp,note) #�� WriteBin��д��
close(note)

#4 strsplite�ַ��з�
Sys.time()
a <- strsplit(as.character(Sys.time())," ") #strsplit ֻ�����ַ��ͣ����ź�Ϊ�Զ���ָ�������
unlist(a)
unlist(a)[1]

#5 lappy().paste()
html = getURL("http://rfunction.com/code/1202/")

# XML
#2.1 ץȡ��������
library("RCurl")
library("XML")
url = "http://www.bioguo.org/AnimalTFDB/BrowseAllTF.php?spe=Mus_musculus"
wp <- getURL(url)
doc <- htmlParse(wp,asText= TRUE) #���������ı�
tables <- readHTMLTable(doc) 
tables <- readHTMLTable(doc,which = 5)  #��ȡ�����ĵ���whichΪ�����еڼ���
tables <- readHTMLTable(doc,header = F)  #����ȡ����ͷ

url = "http://www.csndmc.ac.cn/wdc4seis@bj/earthquakes/csn_quakes_p001.jsp"
wp <- getURL(url)
doc <- htmlParse(wp,asText = TRUE)
tables <- readHTMLTable(doc,header = F)  

#2.2 XPath,���� XML �Ĳ�������
url="http://www.w3school.com.cn/example/xmle/books.xml"
doc <- xmlParse(url)
getNodeSet(doc,'/bookstore/book[1]')
getNodeSet(doc,'/bookstore/book[position()<3]')  #position ��ʾǰ����
# / ѡ����ڵ�
# // ѡ������λ�õ�ĳ���ڵ�
# @ ѡ��ĳ������
getNodeSet(doc,'//title[@lang]') 

#2.3 ץȡ���ڵ���
myheader = c(
"Accept:image/webp,*/*;q=0.8",
"Accept-Language:zh-CN,zh;q=0.8",
"Connection:keep-alive",
"User-Agent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36 LBBROWSER"
)
url="http://t.dianping.com/xiamen"
temp <- getURL(url,httpheader=myheader) #����˴�û��αװheader���᷵��302����
write.table(temp,"temp.txt")
doc <- htmlParse(temp)


