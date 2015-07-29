var fs = require('fs')
  , path = require('path')

fs.readFile(process.argv[2], count_new_lines) // readFile 可以使用callback

function count_new_lines(error, text) { //Callback 函数
	if (error)
		return console.log(errors)
	var lineCount = text.toString().split('\n').length - 1
	console.log(lineCount)
}