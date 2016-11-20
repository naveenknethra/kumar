<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping:Shop Online for Best Mobiles-Sign-Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/styles/bootstrap.css">
<script src="resources/scripts/ajaxjquery.js"></script>
<script src="resources/scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/styles/home.css">
<link rel="stylesheet" href="resources/styles/signup.css">

</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

<body background="resources/Images/bg2.jpg"style="background-repeat:no-repeat; background-size:cover;">

  <div class="container signuparea" style="width: 650px; height: 350px;">
      <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
           <center>
                <h1>SIGN UP</h1>
            </center><br>
            
            <form:form action="register" commandName="adduser">
            
               <label for="usernamel3" class="col-sm-2 control-label">UserName</label>
					<div class="col-sm-10">
						<form:input path="name" cssClass="form-control" placeholder="User name" required="true" />
						
					</div>
					<br><br><br>
					
					
					 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			<div class="col-sm-10">
				<form:input path="email" cssClass="form-control" placeholder="Email" required="true" />
			</div>
					<br><br><br>
			
			 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>		 	 
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" placeholder="Password" required="true" />

		</div>	<br><br>
		<br>
		
	
		<div class="col-sm-1"></div>
		 <div class="col-sm-10">
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				SIGN UP</button>			
		</div>
		</form:form>
					
	</div>

	<br>
	</div>
	</div>
	
</body>
</html>