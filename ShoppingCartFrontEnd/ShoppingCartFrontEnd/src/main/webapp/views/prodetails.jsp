<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/styles/bootstrap.css">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<br>
<br>

<div class="container-fluid">

     <div class="row">
      <div class="col-md-1">
      </div>
      <div class="col-md-10">
      
	<div class="row">
	<c:if test="${!empty homecatpro}">
	<div class="col-lg-6"><br>
		<div clas="thumbnail">
			<img src="resources/images/${homecatpro.pro_id }.jpg" style="width:500px; height:400px;">
		</div>	
	</div>
		
	<div class = "row">	
	<div class="col-lg-6"><br><br><br>
	<div class col-sm-1></div>
		<h2>${homecatpro.pro_name }</h2><br>
		<h3> Rs. ${homecatpro.price }/-</h3><br>
		<h4><p>${homecatpro.pro_desc }</p></h4>
	<p><br></div><br><br>
	<c:choose>
	<c:when test="${pageContext.request.userPrincipal.name == null}">
		<a class="btn btn-primary" href="loginUser">Add to Cart</a>
		</c:when>
		<c:otherwise>
		<a class="btn btn-primary" href="<c:url value='cart/add/${homecatpro.pro_id}' />">Add to Cart</a>
		</c:otherwise>
	</c:choose>

     <c:choose>
     <c:when test="${pageContext.request.userPrincipal.name == null}">
        <a class="btn btn-success" href="loginUser">Buy now</a>
     </c:when>	
      <c:otherwise>
        <a class="btn btn-success" href="payment">Buy now</a>
      </c:otherwise>
	</c:choose>
	</p>
		
	</div>
	</c:if>
	</div>

</div>

</div>
</body>
</html>