function TextController($scope) {
	$scope.someText = "You have started into the Ocean";
}

function SomeController($scope) {
	$scope.youCheckedIt = 0;
}

function StartUpController($scope) {
	 $scope.funding = { startingEstimate: 0 };
	 
	 $scope.computeNeeded = function() {
		$scope.needed = $scope.startingEstimate * 10;
 };
}