<!DOCTYPE html>
<html lang="en">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>
	<h2>Hello World!</h2>
	<div data-ng-app="myApp" data-ng-controller="formCtrl">
		<form name="formData">
			User name :<br> <input type="text" data-ng-model="username">
			<br> Password:<br> <input type="text"
				data-ng-model="password"> <br> Gender:<br> <input
				type="radio" data-ng-model="gender" value="male">Male <input
				type="radio" data-ng-model="gender" value="female">Female <br>
			Mobile:<br> <input type="number" data-ng-model="mobile">
			<br> <br>
			<button data-ng-submit="submit()">Submit</button>
		</form>
	</div>

	<script>
  var app = angular.module('myApp', []);
  app.controller('formCtrl', function($scope, $http) {
	  var data={
    	  username: $scope.formData.username,
    	  password: $scope.formData.password,
    	  gender: $scope.formData.gender,
    	  mobile: $scope.formData.mobile  
      },
      $http.put('/Register', data);
  })
  </script>
</body>
</html>
