<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 80%;
      margin: auto;
      height:150;
  }
  </style>

</head>
<body>
<body bgcolor="lavender">
<nav class="navbar navbar" style=background-color:#666666>
<nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><h4>Welcome to cilory</h4></a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="http://localhost:8080/Front/Home.jsp">Home</a></li>
			</ul>
			<c:if test="${!empty categoryList}">
				<div class="collapse navbar-collapse" >
      <ul class="nav navbar-nav navbar-left">
						<c:forEach items="${categoryList}" var="category">
							<li><a href="${category.name}">${category.name}</a></li>
						</c:forEach></ul></div>
						<div class="collapse navbar-collapse" >
      <ul class="nav navbar-nav navbar-right">
						<li style="float: right"><a href="${userId}/viewcart"> View Cart</a></li>
						<li style="float: right"><a href="#">Hi, ${name}</a></li>
				</ul></div>
				</nav>
			</c:if>
				<div class="collapse navbar-collapse" >
      <ul class="nav navbar-nav navbar-right">	
					<form action="login"><li><a href="#" >
					<span class="glyphicon glyphicon-log-in" ></span>
							<input type= "submit" class ="btn btn-info" value="login"/></a></li></form>
					<form action="signup"><li><a href="#" >
					<span class="glyphicon glyphicon-log-in" ></span>
							<input type= "submit" class="btn btn-info" value="Signup"/></a></li></form></ul>
</div>
</div>
</nav>
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/cute4.jpg" /> alt="cute4">
      </div>

      <div class="item" style="width:80%; height:100">
        <img src=<c:url value="/resources/Images/5.jpg" /> alt="5">
      </div>
      <div class="item" style="width:80%; height:200">
        <img src=<c:url value="/resources/Images/cute3.jpg" /> alt="cute3">
      </div>
      <div class="item" style="width:60%; height:100">
        <img src=<c:url value="/resources/Images/3.jpg" /> alt="3">
      </div>
      

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div style="width:100%; height:20;"></div>
<c:if test="${!empty productList}">
		<div>
			<ul>
				<c:forEach items="${productList}" var="product">
					<li><a href="#${product.name}"><img alt="${product.id}" src="<c:url value="/resources/Images/product/${product.id}.jpg"></c:url>"></a></li>
					<li><a href="${userId}//addtoCart//${product.id}">Add to Cart</a></li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</body>
</html>

