(function(){
	var app = angular.module("store",[]);
	
	app.controller("StoreController",function(){ // 目的：用Controller存储 Data
		this.products = gems;
	})
	
	var gems = [
		{
			name: "Dode",
			price: 2.65,
			description: "Abula Abula Shakalaka",
		},
		{
			name: "Gem",
			price: 7.32,
			description: "Abula Abula Shakalaka",
		}
	];
})();