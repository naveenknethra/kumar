<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	background-image: url(resources/images/na.jpg);
	background-size: cover;
	background-repeat: no-repeat;
}

th {
	color: white;
	background-color: black;
}

table, th, td {
	border: 1px solid black;
	align: center;
}

h2 {
	color: black;
	font-family: "Times New Roman", Times, serif;
}

.navbar {
	background: purple;
}
</style>
<body>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand">My Mobiles</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="homepage"><span
					class="glyphicon glyphicon-home"></span></a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">

			<li class="divider-vertical"></li>
			<c:if test="${pageContext.request.userPrincipal.name != null}">



				<c:if test="${pageContext.request.userPrincipal.name  == 'admin'}">
					<li><a href="<c:url value="/admin" />">View ALL</a></li>
				</c:if>

				<li><a>Hello, ${pageContext.request.userPrincipal.name}</a></li>
				<li><a href="<c:url value="/j_spring_security_logout" />">
						<span class="glyphicon glyphicon-log-out"></span> Log Out
				</a></li>
			</c:if>

			<c:if test="${pageContext.request.userPrincipal.name  == null}">
				<li><a href="<c:url value="/loginUser" />"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li><a href="<c:url value="memberShip.obj" />"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</c:if>



		</ul>



	</div>
	</nav>



	<div class="container-fluid">
		<h3>
			<center>YOUR CART</center>
		</h3>
		<br> <br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">


					<c:if test="${!empty cartList}">
						<table class="table table-condensed" align="center" style="background:white">
							<tr>
			
								<th width="100">Product Name</th>
								<th width="100">Price</th>
								<th width="100">Image</th>
								<th width="100" align="center">Delete</th>

							</tr>
							<c:forEach items="${cartList}" var="cart">
								<tr>
				
									<td align="center">${cart.productName}</td>
									<td align="center">${cart.price}</td>
									<td align="center"><img src="resources/images/${cart.cartprid}.jpg" style="width:100px; height: 150px;"></td>




									<td align="center"><a
										href="<c:url value='cart/delete/${cart.id}' />"><button
												type="button" class="btn btn-info">Delete</button></a></td>
								</tr>
							</c:forEach>
						</table>

					</c:if>
					
					
					
					
					
				</div>
			</div>
		</div>
		<br>
		
		 <br>
		<div style="text-align: center;">

			<a href="homepage"><button type="button" class="btn btn-success"
					align="center">CONTINUE SHOPPING</button>
				</h4></a> <br> <br> <a href="checkout">

					
					<c:if test="${!empty cartList}">
					
					<button type="button" class="btn btn-primary">Checkout and
						Pay</button>
					</c:if>
				</h4></a>
		</div>
</body>
</html>