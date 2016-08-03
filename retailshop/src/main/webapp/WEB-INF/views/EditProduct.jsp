<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Product</title>
</head>
<body>
 <center> 

  <div style="color: teal; font-size: 30px">Edit Product</div>

  
  <form:form id="registerForm" modelAttribute="pm" method="post" action="updateProduct">
   <table width="400px" height="150px">
    <tr>
     <td><form:label path="pid">id</form:label>
     </td>
     <td><form:input path="pid" value="${PIDObj.pid}" disabled="true"/> 
     </td>
    </tr>
    <tr>
     <td><form:label path="pname">Productname</form:label>
     </td>
     <td><form:input path="pname" value="${PIDObj.pname}" disabled="true"/>
     </td>
    </tr>
    <tr>
     <td><form:label path="pdesc">Description</form:label>
     </td>
     <td><form:input path="pdesc" value="${PIDObj.pdesc}" />
     </td>
    </tr>
    <tr>
     <td><form:label path="price">Price</form:label>
     </td>
     <td><form:input path="price" value="${PIDObj.price}" />
     </td>
    </tr>
    <tr>
     <td></td>
     <td><input type="submit" value="Register" /></td>
    </tr>
   </table>
  </form:form>
 <br>
<a href="productsInfo?name=all">Click Here to see Product List</a>
 </center>
</body>
</html>