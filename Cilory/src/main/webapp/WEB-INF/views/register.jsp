<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<center><h1 style="font-family:verdana">NEW REGISTRATION</h1></center>
<div class="fluid">
<c:url var="addAction" value="adduser"></c:url>
<form:form action="${addAction}" commandName="userDetails" method="post">

		
				<div>
					<form:input path="name" type="text" placeholder="Name" 
						pattern=".{5,15}" required="true" id="username" name="username"
						title="minimum length for name is 5" />
				</div>
				<div>
					<form:input path="userName" type="text" placeholder="Username"
						pattern=".{5,15}" required="true" id="username" name="username"
						title="minimum length for username is 5" />
				</div>
				<div>
					<form:input path="password" type="password" placeholder="Password"
						required="true" id="password" name="password" />
				</div>
				<div>
					<input type="password" placeholder="Re-Enter Password"
						required oninput="check(this)" />
				</div>
				<div>
					<form:input path="email" type="email" placeholder="Email"
						required="true" id="username" name="username" />
				</div>
				<div>
					<form:input path="mobile" type="text" placeholder="Mobile"
						pattern="^[789]\d{9}$" required="true" id="username"
						name="username" title="Enter valid 10 digit mobile number" />
				</div>
				<div>
					<input type="submit" value="Register" /> <a href="#">Lost your
						password?</a> <a href="login">Sign In</a>
				</div>

			</form:form>	</div>
</body>
</html>