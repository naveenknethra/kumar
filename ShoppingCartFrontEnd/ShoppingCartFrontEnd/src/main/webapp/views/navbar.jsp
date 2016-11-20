<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping:Shop Online for Best Mobiles-My Mobiles.com</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/styles/bootstrap.css">
<script src="resources/scripts/ajaxjquery.js"></script>
<script src="resources/scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/styles/home.css">

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" >My Mobiles.com</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a href="homepage"><span class="glyphicon glyphicon-home" >.Home</span></a></li>
          
          <c:if test="${pageContext.request.userPrincipal.name == 'naveen'}">
          	<li><a href="admin"><span class="glyphicon glyphicon-home" >Admin-Home</span></a></li>
          </c:if>
         

        <form class="navbar-form navbar-left">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search for the prduct">
          </div>
          <button type="submit" class="btn btn-default">Search</button>
        </form>
        <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
      <ul class="dropdown-menu">
       
       <c:if test="${!empty hcatlist}"></c:if>
       <c:forEach items="${hcatlist}" var="homecatlist">
       <li><a href="category${homecatlist.cat_id}">${homecatlist.cat_name}</a></li>
</c:forEach>

      </ul>
      </ul>
        <ul class="nav navbar-nav navbar-right">
        	<c:if test="${pageContext.request.userPrincipal.name != null}">
        	   <li><h4>Hello,  ${pageContext.request.userPrincipal.name}</h4></li>
        	
        	<c:if test="${pageContext.request.userPrincipal.name != 'naveen'}">
				<li><a href="<c:url value="/myCart" />"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a>${cartSize}</li>
			</c:if>
        	
        		
        		<li> <a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-in" aria-hidden="true">Log-Out</span></a></li>
        	
        	</c:if>
        	
        	<c:if test="${pageContext.request.userPrincipal.name == null}">
        		<li> <a href="loginUser"><span class="glyphicon glyphicon-log-in" aria-hidden="true">.Log-In</span></a></li>
           		<li> <a href="<c:url value="memberShip.obj" />"><span class="glyphicon glyphicon-log-out" aria-hidden="true">.SignUp</span></a></li>
        	</c:if>
        	
        
       
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  
</body>
</html>