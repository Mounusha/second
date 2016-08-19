<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
 
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap css files  -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>	
	
</head>
<body bgcolor="blue">
<style>
div {
    height: 150px;
    width: 90%;
}
</style>
</div>

<nav class="navbar navbar" style=background-color:lavender>
  <h1 style="font-family:verdana">CILORY</h1>
  <h4>The Fashion Hub</h4>
  </nav>
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
	<div class="btn-group">
  <center>
  <form action="product">
    <button type="submit" class="btn btn-success">Add product</button>
  </form><br>
   <form action="category">
<button type="submit" class="btn btn-success">Add Category</button>
</form><br>
  
   <form action="supplier">
<button type="submit" class="btn btn-success">Add supplier</button>
</form></center><br>
</div></div></nav>
 
 
  

<div>
<c:choose>
    <c:when test="${ProductPageClicked}">
       <c:import url="/WEB-INF/views/addproduct.jsp"></c:import>
    </c:when>
    <c:otherwise>
       
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${CategoryPageClicked}">
       <c:import url="/WEB-INF/views/addcategory.jsp"></c:import>
    </c:when>
    <c:otherwise>
       
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${SupplierPageClicked}">
       <c:import url="/WEB-INF/views/addsupplier.jsp"></c:import>
    </c:when>
    <c:otherwise>
       
    </c:otherwise>
</c:choose>
</div>


</body>
</html>