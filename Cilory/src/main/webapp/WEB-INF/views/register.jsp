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
 <div class="container" style="margin-top: 3%;">
    <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-primary">
            <div class="panel-heading">Signup</div>
            <div class="panel-body">
<c:url var="addAction" value="adduser"></c:url>
<form:form action="${addAction}" commandName="userDetails" method="post">
<center>
  <div class="row">
				 <div class="form-group col-xs-12">
                    <label for="name"><span class="text-danger" style="margin-right:1px;">*</span>Name:</label>
                        <div class="input-group">
					<form:input path="name" type="text" class="form-control input-sm chat-input" placeholder="Name" 
						pattern=".{5,15}" required="true" id="username" name="username"
						title="minimum length for name is 5" />
				</div></div></div>
				
				<div class="row">
				 <div class="form-group col-xs-12">
                    <label for="userName"><span class="text-danger" style="margin-right:1px;">*</span>UserName:</label>
                        <div class="input-group">
					<form:input path="userName" type="text" class="form-control input-sm chat-input" placeholder="Username"
						pattern=".{5,15}" required="true" id="username" name="username"
						title="minimum length for username is 5" />
				</div></div></div>
				
				<div class="row">
				 <div class="form-group col-xs-12">
                    <label for="password]"><span class="text-danger" style="margin-right:1px;">*</span>Password:</label>
                        <div class="input-group">
					<form:input path="password" type="password" class="form-control input-sm chat-input" placeholder="Password"
						required="true" id="password" name="password" />
				</div></div></div>
				
				<div class="row">
				 <div class="form-group col-xs-12">
                    <label for="password"><span class="text-danger" style="margin-right:1px;">*</span>Re-Enter Password:</label>
                        <div class="input-group">
					<input type="password"  class="form-control input-sm chat-input"placeholder="Re-Enter Password"
						required oninput="check(this)" />
				</div></div></div>
				
				<div class="row">
				 <div class="form-group col-xs-12">
                    <label for="email"><span class="text-danger" style="margin-right:1px;">*</span>Email id:</label>
                        <div class="input-group">
					<form:input path="email" type="email" class="form-control input-sm chat-input" placeholder="Email"
						required="true" id="username" name="username" />
				</div></div></div>
				
				<div class="row">
				 <div class="form-group col-xs-12">
                    <label for="mobile"><span class="text-danger" style="margin-right:1px;">*</span>Mobile no:</label>
                        <div class="input-group">
					<form:input path="mobile" type="text" class="form-control input-sm chat-input" placeholder="Mobile"
						pattern="^[789]\d{9}$" required="true" id="username"
						name="username" title="Enter valid 10 digit mobile number" />
				</div></div></div>
				<div>
				  <button class="btn btn-primary" type="submit">register</button> <a href="#">Lost your
						password?</a> <a href="login">Sign In</a>
				</div>
</center>
</form:form>	</div></div></div></div>
</body>
</html>