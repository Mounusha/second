<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Spring 4 MVC + Hibernate</title><%-- 
 <script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/> --%>
</head>
<body>
  <c:url var="addAction" value="addItem" ></c:url>
  

<form:form action="${addAction}" modelAttribute="item" id="btn-add">
   <h3>
                    <c:if test="$(item.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty Item.id}">
		      Update Item for Id: <c:out value="${item.id}"/>
		     <%--  <form:hidden path="id"/> --%>
	            </c:if>
         
	  <table>
	  
	  <tr>  <c:if test="${item.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> 
	    <tr> <td>Price: </td> <td><form:input path="price"/></td> 
		
  
	    <tr> <td colspan="2">
    	        <c:if test="${item.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${item.id!=0}">
			      <input type="submit" value="Update" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
	  <table>   
		 <tr>	 <td> ID </td>
		        	 <td> Name </td>
				 <td> Description</td>
				 <td> Price </td>
				 <td colspan="2"> City </td>
	      	</tr>
    	      <c:forEach var="obj" items="${allData}">
		      <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 <td> <c:out value="${obj.description}"/> </td>
				 <td> <c:out value="${obj.price}"/> </td>
				
				 <td> <a href="deleteById/${obj.id}">Delete </a> |
				     <a href="ItemById/${obj.id}">Edit</a> 
				 </td>
		      </tr>
	      </c:forEach>
          </table> 
 </form:form>
 
</table>

</body>
</html> 
