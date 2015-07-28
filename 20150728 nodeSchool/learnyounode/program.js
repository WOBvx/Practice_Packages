// console.log("HELLO WORLD");
// console.log(process.argv);

// var a = process.argv.length; 调用length
// console.log(a);
var total = process.argv.length; //process.argv 是一个全局变量，用于输出js 所OUT的字符。
var Num = 0;
for (i=2;i<total;i++){
  Num += +process.argv[i];
};
console.log(Num);


// 第二个实验（Baby Steps）的过程中，不停的调用 node 对这个program.js 进行测试
// 得出了结论就是 node 是用来测试 Javascript 的工具
