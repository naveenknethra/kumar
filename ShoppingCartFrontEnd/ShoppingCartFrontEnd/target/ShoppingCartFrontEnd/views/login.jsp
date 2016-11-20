<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping:Shop Online for Best Mobiles-Log-In</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/styles/bootstrap.css">
<script src="resources/scripts/ajaxjquery.js"></script>
<script src="resources/scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/styles/home.css">
<link rel="stylesheet" href="resources/styles/login.css">

<style>
body{ 
background-image: url(resources/images/back10.jpg); 
background-size:     cover;                      
    background-repeat:   no-repeat;
 } 

</style>
</head>
<body>


	<jsp:include page="navbar.jsp"></jsp:include>
	
	
	<div class="container" style="width: 550px; height: 330px;">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<center>
					<h1>LOG-IN</h1>
				</center>

     <form name="loginForm" action="<c:url value='j_spring_security_check' />" method="post">
                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
                <div class="span9 center">
                   	<c:if test="${not empty msg}">
                 		<div class="msg">${msg} <br><br></div>
            		</c:if>
            		
            		<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">UserName</label>
						<div class="col-sm-10">
							<input type="text" placeholder="Username" name="username" class="login-input"  />

						</div>
					</div>
            		
                	<!-- <input type="text" placeholder="Username" name="username" class="login-input"/> -->
                	<br>
                	<br>
                	
                	<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" placeholder="Password"  name="password" class="login-input"/>

						</div>
					</div>
					
					<br>
                	<br>
					
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								LOG IN</button>
						</div>
					</div>
					<br>
                	<br>
					
					<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<border
							style="border-top: 2px solid#888; padding-top:15px; font-size:100%">
						<h4>
							New to My Mobiles ? <a href="signup"> Sign Up Here
						</h4>

						</a>
					</div>
				</div>
					
				</div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
	
	
	</div></div></div>

<%-- 	<div class="container" style="width: 550px; height: 300px;">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<center>
					<h1>LOG-IN</h1>
				</center>

				<form:form action="userlogin" commandName="adduser" method="POST">

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">UserName</label>
						<div class="col-sm-10">
							<form:input path="name" cssClass="form-control"
								placeholder="User Name" required="true" />

						</div>
					</div>
					<br>
					<br>
					<br>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<form:password path="password" cssClass="form-control"
								placeholder="Password" required="true" />

						</div>
					</div>
					<br>
					<br>

					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								LOG IN</button>
						</div>
					</div>

				</form:form>

				<br> <br>


				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<border
							style="border-top: 2px solid#888; padding-top:15px; font-size:100%">
						<h4>
							New to My Mobiles ? <a href="signup"> Sign Up Here
						</h4>

						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
 --%>

</body>
</html>