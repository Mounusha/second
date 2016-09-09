<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<center><br><br><h2 style="font-family:verdana;">Supplier Page</h2>
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
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body>
<body style="background-color:#ff3399;">
<li style="float: right"><a href="perform_logout"
	class="btn btn-info"><i class="glyphicon glyphicon-log-out">logout</i></a></li>
<c:url var="addAction" value="addsupplier"></c:url>
	<form:form action="${addAction}" commandName="supplier">
	<center>
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty supplier.id}">
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
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>
				<td><form:input path="address" required="true" /></td>
			</tr>			
			<tr>
				<td colspan="2"><c:if test="${!empty supplier.name}">
						<input type="submit"
							value="<spring:message text="Edit Supplier"/>" />
					</c:if> <c:if test="${empty supplier.name}">
						<input type="submit" value="<spring:message text="Add Supplier"/>" />
					</c:if></td>
			</tr>
		</table>
		</center>
	</form:form>
	<br>
	
	<c:if test="${!empty supplierList}">
	<h3 style="font-family:verdana;">Supplier List</h3>
	<style>
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
</style>
	

	<c:choose>
		<c:when test="${!EditSupplier}">
			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Supplier"
						style="width:60%">

				</form>
				<br>
				
				<table class="table table-bordered table-hover ">
					<thead>
						<tr >
							<th>Supplier ID</th>
							<th>Supplier Name</th>
							<th>Supplier Address</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<tr
							data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">
							<td >{{supplier.id}}</td>
							<td>{{supplier.name}}</td>
							<td>{{supplier.address}}</td>
							<td><a class="btn btn-info btn-xs"
								href="editsupplier/{{supplier.id}}">Edit</a></td>
							<td><a class="btn btn-info btn-xs"
								href="removesupplier/{{supplier.id}}">Delete</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div style="margin-bottom: 70px"></div>
		</c:otherwise>
	</c:choose>
	</c:if>
</body>
</html>