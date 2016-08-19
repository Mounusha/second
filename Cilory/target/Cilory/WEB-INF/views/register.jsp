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
<body style="background-color:Lavender;">
<div class="container">
<form method="post" action="signup1">
<div class="form-group">
<label for="First Name">First Name</label>
      <input type="First Name" class="form-control" id="First Name" placeholder="Enter First Name">
</div>
<div class="form-group">
<label for="Last Name">Last Name</label>
      <input type="Last Name" class="form-control" id="Last Name" placeholder="Enter Last Name">
</div>
<div class="form-group">
<label for="Email">Email id</label>
      <input type="Email" class="form-control" id="Email" placeholder="Enter Email">
</div>
 <div class="form-group">
      <label for="username">username</label>
      <input type="username" class="form-control" id="username" placeholder="Enter username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
<input type="submit" value="Submit" />
<input type="reset" value="Reset" />
	</form>
	</div>
</body>
</html>