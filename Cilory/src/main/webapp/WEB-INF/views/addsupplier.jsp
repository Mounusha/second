<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SUPPLIER</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
</head>
<body>
	<h1>SUPPLIER PAGE</h1>
	
	
	<c:url var="addAction" value="addsupplier"></c:url>

	<form:form action="${addAction}" commandName="supplier"
		enctype="multipart/form-data" method="post">
		
			<table class="panel panel-danger">
			<thead>
				<tr>
					<%-- <td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td> --%>
					<c:choose>
						<c:when test="${!empty supplier.id}">
							<%-- <td><form:input path="id" disabled="true" readonly="true" /> --%>
							</td>
						</c:when>

						<c:otherwise>
							<td><form:input path="id" pattern="{3,10}" required="true"
									title="id should contains 3 to 10 characters" /></td>
						</c:otherwise>
					</c:choose>
				<tr>
					<form:input path="id" hidden="true" />
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

				<%-- <tr>
					<td><form:label path="image">
							<spring:message text="Image" />
						</form:label></td>
					<td><form:input type="file" path="image" required="true" /></td>
				</tr> --%>


				<tr>
					<td colspan="2"><c:if test="${!empty supplier.name}">
							<input type="submit"
								value="<spring:message text="Edit Supplier"/>" />
						</c:if> <c:if test="${empty supplier.name}">
							<input type="submit"
								value="<spring:message text="Add Supplier"/>" />
						</c:if></td>
				</tr>
		</table>
	</form:form>
	<br>

	<c:if test="${!empty supplierList}">
		<h1>Supplier List</h1>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Supplier ID</th>
					<th>Supplier Name</th>
					<th>Supplier Address</th>



					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${supplierList}" var="supplier">
					<tr>
						<td>${supplier.id}</td>
						<td>${supplier.name}</td>
						<td>${supplier.address}</td>

						<td>
							<form action="editsupplier/${supplier.id}" method="post">
								<input type="submit" value="Edit" class="w3-btn w3-blue">
							</form>
						</td>
						<td><form action="removesupplier/${supplier.id}">
								<input type="submit" value="Delete" class="w3-btn w3-red">
							</form></td>
					</tr>
				</c:forEach>
			</thead>
		</table>
	</c:if>
	
	

</body>
</html>