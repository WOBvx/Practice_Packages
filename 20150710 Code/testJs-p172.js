var dataset = [11,22,13,34,25,16,7,8,9,10,1,2,34,5,16,27,8,19,30];

var w = 500; 
var h = 200;
var svg = d3.select("body")
			.append("svg")
			.attr("width",w)
			.attr("height",h);
		
svg.selectAll("rect") 
		.data(dataset)
		.enter()
		.append("rect")
		.attr("x",function(d,i){
			return i*21;
		})
		.attr("y",function(d){
			return h-(d*4) ; 
		})
		.attr("width",20)
		.attr("height", function(d) {
			return d*4;
		})
		.attr("fill",function(d){
			return "rgb(0,0," + (d * 10) + ")";})
		.on("mouseover",function(){ // <-- 鼠标经过高亮显示
			d3.select(this)
				.attr("fill","orange")})
		.on("mouseout",function(d){ // <-- 鼠标离开，颜色还原
			d3.select(this)
				.transition()   // <-- 两句代码用于实现"水润丝滑"版
				.duration(250)  //
				.attr("fill","rgb(0,0," + (d * 10) + ")")
		});

svg.selectAll("text") 
	.data(dataset)
	.enter()
	.append("text")
	.text(function(d){
		return d;
	})
	.attr("x",function(d,i){
		return i*21;
	})
	.attr("y",function(d){
		return h - 2 - (d*4);
	});