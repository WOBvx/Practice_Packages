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
		.on("mouseover",function(d){
			var xPosition = parseFloat(d3.select(this).attr("x"));
			var yPosition = parseFloat(d3.select(this).attr("y"));
			d3.select("#tooltip")
				.style("left",xPosition + "px")
				.style("top",yPosition + "px")
				.select("#value")
				.text(d);
			d3.select("#tooltip").classed("hidden",false);
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