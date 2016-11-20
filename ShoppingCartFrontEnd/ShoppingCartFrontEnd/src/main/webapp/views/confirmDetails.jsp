<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<style>

body{ 
background-image: url(resources/images/back12.jpg); 
background-size:     cover;                      
    background-repeat:   no-repeat;
 } 


 th{
    color: light blue;
    backgr	ound-color: #9ACD32;
}
 
 .navbar{
  background: purple;
  }
 


</style>
</head>


<body style="background-color:white;">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >My Mobiles</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="homepage"><span class="glyphicon glyphicon-home"></span></a></li>
     
     </ul>
      
      
  </div>
</nav>

</div>

<div class="container-fluid" style="width: 650px; height: 350px;">
      <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
           
<h2><center>PLEASE CONFIRM YOUR DETAILS</center></h2>
		<br>
		<br>
		<div class="container-fluid">
	
<!-- <div class="col-md-2">
  <div class="row-fluid"> -->
		<fieldset>
			
			<sf:form modelAttribute="userDetails">
				
				<sf:label path="name"  class="col-sm-3 control-label"> User Name     :</sf:label>
				 ${userDetails.name}
					<br />
				<br />
				<sf:label path="password"  class="col-sm-3 control-label">Password :</sf:label> ${userDetails.password}
				<br>
					<br>
                <sf:label path="email"  class="col-sm-3 control-label">Email :</sf:label> ${userDetails.email}
					<br />
				<br />
				<sf:label path="mob_no"  class="col-sm-3 control-label">Mobile No :</sf:label> ${userDetails.mob_no}
					<br />
				<br />
				<sf:label path="address"  class="col-sm-3 control-label">Address :</sf:label> ${userDetails.address}
					<br />
				<br /><br />
				<div class="col-sm-1"></div>
				<div class="col-sm-2">
				<input name="_eventId_edit" type="submit"  class="btn btn-primary" value="Edit" /></div>
				<div class="col-sm-3">
				<input name="_eventId_submit" type="submit" class="btn btn-success" value="Confirm Details" /></div>
				<br />
			</sf:form>
		</fieldset>
	</div>
	</div>
	</div></div></div></div>
</body>
</html>