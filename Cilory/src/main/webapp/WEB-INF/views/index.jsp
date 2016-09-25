<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Cilory</title>
  <meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/resources/css/my.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link
	href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script><style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 80%;
      margin: auto;
      height:150;
  }
  </style>

</head>
<body>
<nav class="navbar" style=background-color:#FFF8DC>
<nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<a class="navbar-brand" href="index"><h4>Welcome to Cilory</h4></a>
			<ul class="nav navbar-nav"></ul></div>
			<c:choose>
					<c:when test="${LoggedIn}">

						<li style="float: right"><a href="perform_logout"
							class="w3-hover-none"><i class="glyphicon glyphicon-log-out">logout</i></a></li>
						<c:choose>	
						<c:when test="${!Administrator}">	
						<li style="float: right"><a href="viewcart"
							class="w3-hover-none"><i class="glyphicon glyphicon-shopping-cart"></i>(${cartsize})</a></li>
						</c:when>
						</c:choose>

						<li style="float: right"><a href="#" class="w3-hover-none"><i
								class="glyphicon glyphicon-user"></i> Hi, ${name}</a></li>
					</c:when>
					<c:otherwise>
						<div class="collapse navbar-collapse" >
                          <ul class="nav navbar-nav navbar-right">	
                         <li class="active"><a href="login"> <span
								class="glyphicon glyphicon-log-in"></span>
								<input type= "submit" class ="btn btn-info" value="login"/>
						</a></li>
						<li class="active"><a href="Register"> <span
								class="glyphicon glyphicon-user"></span>
								<input type= "submit" class="btn btn-info" value="Signup"/>
						</a></li>

					</ul>
				</div>
					</c:otherwise>
				</c:choose>
				</nav>
				
	<c:choose>	
		<c:when test="${!Administrator}">	
			<!-- Category List -->
			<c:if test="${!empty categoryList}">
				<div class="container fluid" >
                 <ul class="nav navbar-nav navbar-left">
                 <ul class="nav nav-pills">
						<c:forEach items="${categoryList}" var="category">
								<li><a href="view/${category.id}"><i
										class="glyphicon glyphicon-align-justify" aria-hidden="true"></i>
										${category.name}</a></li>
						</c:forEach>
					</ul>
					</ul>
				</div>
			</c:if>	
		</c:when>	
		<c:when test="${Administrator}">
                 <div class="btn-group btn-group-justified">
				<div class="btn-group"><a href="product"class="btn btn-primary"> Products</a></div>
				<div class="btn-group"><a href="category" class="btn btn-primary">Category</a></div>
				<div class="btn-group"><a href="supplier" class="btn btn-primary"> Supplier</a></div>
					</div>
			
		</c:when>
	</c:choose><!-- category list -->
	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/cart.jsp">
			</c:import>
		</c:when>
		<c:when test="${IndividualItemClicked}">
			<c:import url="/WEB-INF/views/IndividualItem.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/views/Payment.jsp">
			</c:import>
		</c:when>
		<c:when test="${ViewCategoryClicked}">
			<c:import url="/WEB-INF/views/viewitem.jsp">
			</c:import>
		</c:when>
	</c:choose>
	<!-- Category List End -->
	<c:choose>
		<c:when test="${IfLoginClicked}">
			<c:import url="/WEB-INF/views/login.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/views/register.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${ProductPageClicked}">
			<c:import url="/WEB-INF/views/addproduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${CategoryPageClicked}">
			<c:import url="/WEB-INF/views/addcategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${SupplierPageClicked}">
			<c:import url="/WEB-INF/views/addsupplier.jsp"></c:import>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${!Administrator}">
		<c:if test="${empty HideOthers}">
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/16.jpg" /> alt="16">
      </div>

      <div class="item" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/14.jpg" /> alt="14">
      </div>
      <div class="item" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/18.jpg" /> alt="18">
      </div>
      <div class="item" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/21.jpg" /> alt="21">
      </div>
      <div class="item" style="width:100%; height:200">
        <img src=<c:url value="/resources/Images/19.jpg" /> alt="19">
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
</c:if></c:when></c:choose>

<div style="width:100%; height:20;"></div>
<c:if test="${empty HideOthers}">
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${!empty productList}">
					<div>
						<!-- <ul> -->
						<div class="row w3-card-8 w3-margin" style="margin-bottom: 0px">
							<br>
							<c:forEach items="${productList}" var="product">
								<div class="col-xs-2 ">
									<div class="thumbnail">
										<img height="200px" width="200px" alt="${product.id}"
											src="<c:url value="/resources/Images/product/${product.id}.jpg"></c:url>">
										<div class="caption">
											<p>
												${product.name}
												<c:choose>
													<c:when test="${LoggedIn}">
														<form action="addtoCart/${userId}/${product.id}">
															<input type="number" value="1" name="quantity"
																class="btn btn-xs btn-primary   col-xs-6 ">
															<input type="submit" value="Add" class="btn btn-xs col-xs-6 btn-primary">
														</form>
														
													</c:when>
												</c:choose>
											</p>

										</div>
									</div>
								</div>
								</c:forEach>
						</div>
						
					</div>
				</c:if>
			</c:when>
		</c:choose>
	</c:if>
	</nav>
	<footer>
<div style="background: Lavender">

 <c:choose>
 <c:when test="${!Administrator}">
			<c:if test="${empty HideOthers}">
	<table class="table">
		<thead>
			<tr>
				<th>OUR COMPANY</th>
				<th>TOP CATEGORIES</th>
				<th>POLICIES AND INFO</th>
			</tr>
		</thead>
		<tbody>

			<tr>

				<td>About us<br> Cilory in Media<br> Ethnico<br>
					Place of Origin<br> Blog<br></td>

				<td>Sarees<br> Laptop<br> camera<br>
					mobile<br> Toys<br></td>
				<td>Terms & Conditions<br> Policy for Sellers<br>
					Policy for Buyers<br> Shipping & Refund Policies<br>
					Wholesale Policy<br> Privacy Policy<br></td>
			</tr>
			<tr>
				<th>SUPPORT</th>
				<th>PAYMENT OPTIONS</th>
				<th>STAY CONNECTED</th>
			</tr>
			
			
			<tr>
			<td><i class="fa fa-envelope" style="font-size: 30px;"></i>
			
					<a href="mailto:supportproduct@company.com">supportproduct@Cilory.com</a><br>
					<i class="fa fa-phone" style="font-size: 30px; "></i>
				<a>+91 9876356377</a>
				<i class="fa fa-map-marker" style="font-size: 30px; color:"></i>
				<a>
					 Banjara hills road no.12 India</a>
				</td>
				<td><div class="footer-icons">
				<a href="#"><i class="fa fa-facebook-official"style="font-size: 30px; "></i> </a>
				<a href="#"><i class="fa fa-twitter" style="font-size: 30px; "></i></a>
				<a href="#"><i class="fa fa-google" style="font-size: 30px; "></i></a>
						<a href="#"><i class="fa fa-whatsapp" style="font-size: 30px; "></i></a>
						<a href="#"><i class="fa fa-github"style="font-size: 30px; "></i></a>
			</div></td>
			<td>
				<a href="#"><i class="fa fa-cc-mastercard" aria-hidden="true" style="font-size: 30px; "></i>
			</a> . <a href="#"><i class="fa fa-cc-visa" aria-hidden="true" style="font-size: 30px;"></i> </a>
			. <a href="#"><i class="fa fa-credit-card" aria-hidden="true" style="font-size: 30px; "></i>
			</a></td>		
			</tbody>
	</table>
</c:if></c:when></c:choose></div>
</footer>

</body>
</html>

