var fs = require('fs'); //引入 fs 模块
var content = fs.readFileSync(process.argv[2],'utf-8'); //导入一个文本
var word = content.split("\n");  //split() 用于分割文本，根据()内内容进行分隔
var count = 0;
count += word.length;
// for (i=0;i<word.length;i++){
  // var word2 = word[i].split("\r");  //此处采用两次分割，因为检测的时候\r也算是一个标准
  // count += word2.length; 
// }
// // var count += word.length;
console.log(count-1);
// console.log(process.argv)
// 时候发现，只要统计 \ 的数量，其实就可以实现了