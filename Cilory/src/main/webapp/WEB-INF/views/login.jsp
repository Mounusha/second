<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar"></nav>
  <h1 style="font-family:verdana">LOGIN FORM</h1>
<body>


	<form action="perform_login" method="post">
		<div class="panel panel-primary">
			<div class="panel-heading center">LOGIN</div>
			<div class="panel-body">
				<div class="well well-sm">
				Username:
					<input type="text" placeholder="Username" required id="username" name="username"
					pattern=".{5,10}"title="minimum length for name is 5"/>
				</div>
				</div>
			<div class="panel-body">
				<div class="well well-sm">
				Password:
					<input type="password" placeholder="Password" required id="password" name="password" 
				title="enter valid credentials"/>
				</div>
			</div>
			<div class="panel-body">
					<label><input type="checkbox"> Remember me</label>
				</div>
				<div>
					<input type="submit" value="Log in" /> <br></div>
</div>

	</form>
</body>
</html>

