<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Information - Converting GSON to JSON</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/sandstone/bootstrap.min.css">
<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<script>
var app = angular.module('myApp', []);
 
function MyController($scope, $http) {

	 $scope.sortType = 'name'; // set the default sort type
	  $scope.sortReverse = false;  // set the default sort order
	  $scope.searchPName = '';
	  
        $scope.getDataFromServer = function() {
                $http({
                        method : 'GET',
                        url : 'GsonCon'
                }).success(function(data, status, headers, config) {
                        $scope.person = data;// alert(data); 
                }).error(function(data, status, headers, config) {
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.
                });
        };
};



</script>
</head>
<body>

<div class="container" ng-app="myApp" ng-controller="MyController" ng-init="getDataFromServer()">
  
  <form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Product Name" ng-model="searchPName">      
       </div>      
    </div>
  </form>
  
  <table class="table table-bordered table-striped">
    
    <thead>
      <tr>
      <td>
          <a href="#" ng-click="sortType = 'pid'; sortReverse = !sortReverse">
            Product Id 
            <span ng-show="sortType == 'pid' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'pid' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a href="#" ng-click="sortType = 'pname'; sortReverse = !sortReverse">
            Product Name 
            <span ng-show="sortType == 'pname' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'pname' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'pdesc'; sortReverse = !sortReverse">
          Description 
            <span ng-show="sortType == 'pdesc' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'pdesc' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'price'; sortReverse = !sortReverse">
          Price 
            <span ng-show="sortType == 'price' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'price' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>Link</td>
      </tr>
    </thead>
    
    <tbody>
      <tr ng-repeat="roll in person | orderBy:sortType:sortReverse | filter:searchPName">
           		<td>{{roll.pid}}</td>
           		<td>{{roll.pname}}</td>
           		<td>{{roll.pdesc}}</td>
           		<td>{{roll.price}}</td>
           		<td>
           			<a href="edit?ProductId={{roll.pid}}">Edit</a> &nbsp;
					<a href="delete?ProductId={{roll.pid}}">Delete</a></td>
      </tr>
    </tbody>
    
  </table>
  <div align="center"><a href=index.jsp>Home Page</a></div>
  <a href="insert"><button type="button" class="btn btn-success">Register the Product</button></a>
  
</div>

</body>
</html>