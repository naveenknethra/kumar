<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
background-image: url(resources/images/back6.jpg); 
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
<body>

<body style="background-color:white;">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >My Mobiles.com</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="homepage"><span class="glyphicon glyphicon-home"></span></a></li>
     
     </ul>
      
      
  </div>
</nav>

 <div class="container-fluid" style="width: 650px; height: 350px;">
      <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
           <center>
                <h2>PLEASE REGISTER HERE</h2>
            </center><br>
            
            <form:form modelAttribute="userDetails">
            
            <form:label path="name"  class="col-sm-3 control-label"> User Name :</form:label>
					<div class="col-sm-8">
					<form:input path="name" cssClass="form-control" placeholder="User name" required="true" />
						</div>
				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('name')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>		
			<br>	<br>		

 			<form:label path="password"  class="col-sm-3 control-label"> Password :</form:label>
					<div class="col-sm-8">
					<form:input type="password" path="password" cssClass="form-control" placeholder="Password" required="true" />
						</div>
				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>		
			<br>	<br>		


          <form:label path="email"  class="col-sm-3 control-label"> Email ID :</form:label>
					<div class="col-sm-8">
					<form:input path="email" cssClass="form-control" placeholder="Email id" required="true" />
						</div>
				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('email')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>		
			<br>	<br>	
			
			 <form:label path="mob_no"  class="col-sm-3 control-label"> Mobile No :</form:label>
					<div class="col-sm-8">
					<form:input path="mob_no" cssClass="form-control" placeholder="Mobile No" required="true" />
						</div>
				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('mob_no')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>		
			<br>	<br>	
				
				 <form:label path="address"  class="col-sm-3 control-label">  Address :</form:label>
					<div class="col-sm-8">
					<form:input path="address" cssClass="form-control" placeholder="Address" required="true" />
						</div>
				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>		
			<br>	<br> <br>
			
	
	<div class="col-sm-1"></div>
						<div class="col-sm-10">
							
				<input name="_eventId_submit" type="submit" class="btn btn-lg btn-primary btn-block" value="Submit" />
				<br /></div>
			</form:form>
		</fieldset>
	</div>
	</div>
	</div>

</body>
</html>