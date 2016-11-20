<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>

<style>
body{ 
background-image: url(resources/images/back12.jpg); 
background-size:     cover;                      
    background-repeat:   no-repeat;
 } 

</style>


</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="row">
  <div class="col-md-1">
  </div>
  <div class="col-md-2">
    <a href="managecategory">Manage Categories</a> &nbsp; &nbsp;  
   <!--  <button type="submit" class="btn btn-warning"> <a href="managecategories">Manage Categories</a></a></button> -->
  </div>
  <div class="col-md-2">
  <a href="managesupplier">Manage Suppliers</a>  &nbsp; &nbsp;
    <!-- <button type="supplier" class="btn btn-warning"><a href="managesupplier">Manage Suppliers</a></a></button> -->
   </div>
  <div class="col-md-2">
  <a href="manageproduct">Manage Products</a>   &nbsp; &nbsp;
    <!-- <button type="product" class="btn btn-warning"><a href="manageproduct">Manage Products</a></a></button> -->
  </div>
  
  

</body>
</html>