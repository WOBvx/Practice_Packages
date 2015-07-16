(function(){
	var app = angular.module("store",[]);
	
	app.controller("StoreController",function(){ // 目的：用Controller存储 Data
		this.products = gems;
	});
	
	app.controller("PanelController",function(){
		this.tab = 1;
		this.selectTab = function(setTab) {
			this.tab = setTab;
		};
	});
	
	var gems = [
		{
			name: "Dode",
			price: 2,
			description: "Abula Abula Shakalaka",
			images:[
			{
				full: './img/icon-full.png',
			},
			],
		},
		{
			name: "Gem",
			price: 7.32,
			description: "Abula Abula Shakalaka",
			images:[
			{
				full: './img/icon-full.png',
			},
			],
		}
	];
})();

