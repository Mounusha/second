<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<center><br><br><h2 style="font-family:verdana;">Category Page</h2></center>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'categorygson'
			}).success(function(data, status, headers, config) {
				$scope.categories = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>

</head>
<body style="background-color:#ff3399;">
<li style="float: right"><a href="perform_logout"
	class="btn btn-info"><i class="glyphicon glyphicon-log-out">logout</i></a></li>
<c:url var="addAction" value="addcategory"></c:url>
	<form:form action="${addAction}" commandName="category">
	<center>
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty category.id}">
						<td><form:input path="id" disabled="true" readonly="true" />
						</td>
					</c:when>

					<c:otherwise>
						<td><form:input path="id" pattern =".{3,10}" required="true" title="id should contains 3 to 10 characters" /></td>
					</c:otherwise>
				</c:choose>
			<tr>
			<form:input path="id" hidden="true"  />
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="description">
						<spring:message text="description" />
					</form:label></td>
				<td><form:input path="description" required="true" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty category.name}">
						<input type="submit"
							value="<spring:message text="Edit category"/>" />
					</c:if> <c:if test="${empty category.name}">
						<input type="submit" value="<spring:message text="Add category"/>" />
					</c:if></td>
			</tr>
		</table>
		</center>
	</form:form>
	<br>
	
	<c:if test="${!empty categoryList}">
	<center><h3 style="font-family:verdana;">Category List</h3></center>
	<style>
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
</style>
	
		
	<c:choose>
		<c:when test="${!EditCategory}">
			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Category"
						style="width: 60%">

				</form>
				<br>
				<table class="table table-bordered table-hover ">
					<thead>
						<tr >
							<th>Category ID</th>
							<th>Category Name</th>
							<th>Category Description</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<tr
							data-ng-repeat="category in categories | orderBy:sortType:sortReverse | filter:search">
							<td >{{category.id}}</td>
							<td>{{category.name}}</td>
							<td>{{category.description}}</td>
							<td><a class="btn btn-info btn-xs"
								href="editcategory/{{category.id}}">Edit</a></td>
							<td><a class="btn btn-info btn-xs"
								href="removecategory/{{category.id}}">Delete</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div style="margin-bottom: 70px"></div>
		</c:otherwise>
	</c:choose>
		</center>
	</c:if>
</body>
</html>