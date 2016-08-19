<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cilory</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/sandstone/bootstrap.min.css">
<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
</head>
<body>

			<c:if test="${!empty CartList}">
	<center><h3 style="font-family:verdana;">Cart List</h3></center>
<center>
		<table class="table table-bordered table-striped">
		<thead>
			<tr>
							<th>Product Name</th>
							<th>Product Quantity</th>
							<th>Product Price</th>
						</tr>
						<c:forEach items="${CartList}" var="cart">
							<tr>
								<td>${cart.productname}</td>
								<td>${cart.quantity}</td>
								<td>${cart.price}</td>
							</tr>
							
						</c:forEach>
						</thead>
					</table>
					</center>
				</c:if>
				Cart Price=${CartPrice}
				
				<a href="/index">Return To Home</a>
				
</body>
</html>