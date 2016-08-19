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
<c:url var="addAction" value="adduser"></c:url>
<form:form action="${addAction}" commandName="userDetails" method="post">

<form:label path="name"><spring:message text="Name" /></form:label><form:input path="name" required="true" /><br>
<form:label path="userName"><spring:message text="UserName" /></form:label><form:input path="userName" required="true" /><br>
<form:label path="password"><spring:message text="Password" /></form:label><form:input path="password" required="true" /><br>
<form:label path="mobile"><spring:message text="Mobile Number" /></form:label><form:input path="mobile" required="true" /><br>
<form:label path="email"><spring:message text="Email" /></form:label><form:input path="email" required="true" /><br>
<input type="submit" value="signup"/><br>
	</form:form>
	</div>
</body>
</html>