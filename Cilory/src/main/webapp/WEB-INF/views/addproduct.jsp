<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<center><br><br><h2 style="font-family:verdana;">Product Page</h2></center>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search ='';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'productgson'
			}).success(function(data, status, headers, config) {
				$scope.products = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body style="background-color:#ff3399;">
<li style="float: right"><a href="perform_logout"
	class="btn btn-info"><i class="glyphicon glyphicon-log-out">logout</i></a></li>
<c:url var="addAction" value="addproduct"></c:url>


<form:form action="${addAction}" commandName="product" enctype="Multipart/form-data">
<center>
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty product.id}">
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
				<td><form:label path="price">
						<spring:message text="price" />
					</form:label></td>
				<td><form:input path="price" required="true" /></td>
			</tr>
			<tr>
							<td><form:label path="supplierid">
									<spring:message text="Supplier" />
								</form:label></td>
							<td><form:select path="supplierid" required="true">
							<c:forEach items="${supplierList}" var="supplier">
								<form:option value="${supplier.id}">${supplier.name}</form:option>
							</c:forEach>
								</form:select></td>
						</tr>
						<tr>
							<td><form:label path="categoryid">
									<spring:message text="Category" />
								</form:label></td>
							<td><form:select path="categoryid" required="true">
							<c:forEach items="${categoryList}" var="category">
								<form:option value="${category.id}">${category.name}</form:option>
							</c:forEach>
								</form:select></td>
						</tr>
			
			<tr>
				<td><form:label path="image">
						<spring:message text="image" />
					</form:label></td>
				<td><form:input path="image" type="file" required="true" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty product.name}">
						<input type="submit"
							value="<spring:message text="Edit product"/>" />
					</c:if> <c:if test="${empty product.name}">
						<input type="submit" value="<spring:message text="Add product"/>" />
					</c:if></td>
			</tr>
		</table>
		</center>
	</form:form>
	<br>
	
	<c:if test="${!empty productList}">
	<center><h3 style="font-family:verdana;">Product List</h3></center>
	<style>
    table {
    border-collapse: collapse;
}
    table, td, th {
    border: 1px solid black;
}
</style>
<c:choose>
		<c:when test="${!EditProduct}">
			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Product"
						style="width: 60%">

				</form>
				<br>
				<table class="table table-bordered table-hover ">
					<thead>
						<tr >
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Product Price</th>
							<th>Supplier Id</th>
							<th>Category Id</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<tr
							data-ng-repeat="product in products | orderBy:sortType:sortReverse | filter:search">
							<td>{{product.id}}</td>
							<td>{{product.name}}</td>
							<td>{{product.description}}</td>
							<td>{{product.price}}</td>
							<td>{{product.supplierid}}</td>
							<td>{{product.categoryid}}</td>
							<td><a class="btn btn-info btn-xs"
								href="editproduct/{{product.id}}">Edit</a></td>
							<td><a class="btn btn-info btn-xs"
								href="removeproduct/{{product.id}}">Delete</a></td>
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