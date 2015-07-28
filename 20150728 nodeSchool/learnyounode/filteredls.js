var fs = require('fs')
var path = require('path')

fs.readdir(process.argv[2], function (err, list) {
// fs.readdir("D:\theTestCode", function (err, list) {
  list.filter(function (file) {
  	return path.extname(file) === '.' + process.argv[3] //过滤器.filter(function(file){return})
  }).forEach(function (file) {
    //遍历数组,有返回值的进行输出
    console.log(file)
  })
})

//1 用readirSync
var a = fs.readdirSync(process.argv[2])
var file = typeof(a)
console.log(file)
console.log(a)

// fs.readdirSync(path)#
// Synchronous readdir(3). Returns an array of filenames excluding '.' and '..'.

// 用Sync，不需要加 Callback，就有返回值

// IN>node filteredls.js . txt //arg[2]用.表示当前目录，txt表示文件类型

// Out>object
// Out>[ '03.js',
// Out>  '123.txt',
// Out>  'filteredls.js',
// Out>  'myfirstasio.js',
// Out>  'myfirstio.js',
// Out>  'program.js' ]
// Out>123.txt


//2 用readir(path, callback)
var a = fs.readdir(process.argv[2])
var file = typeof(a)
console.log(file)
console.log(a)

// Out>undefined
// Out>undefined

//fs.readdir(path, callback)#
//Asynchronous readdir(3). Reads the contents of a directory. The callback gets two arguments (err, files) where files is an array of the names of the files in the directory excluding '.' and '..'.