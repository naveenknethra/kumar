<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

body {
	background-image: url(resources/images/back5.jpg);
	background-size: cover;
	background-repeat: no-repeat;
}	
	
</style>

<body>

<jsp:include page="navbar.jsp"></jsp:include>

<div class="row">
      <div class="col-md-1">
      </div>
      <div class="col-md-10">
        <div class="row">
        
      <c:if test="${!empty caprolists}">
		
					<c:forEach items="${caprolists}" var="catprolist">	
					<div class="col-md-3">
						<div class="thumbnail"><br>
							<img alt="Bootstrap Thumbnail First"
								src="resources/images/${catprolist.pro_id}.jpg" />
							<div class="caption">
								<h3>${catprolist.pro_name}</h3>
								<h4>Rs ${catprolist.price}</h4>
								<p>
								<a class="btn btn-primary" href="<c:url value='homepro${catprolist.pro_id}' />">More</a> 
								
								<c:choose>
	<c:when test="${pageContext.request.userPrincipal.name == null}">
		<a class="btn btn-primary" href="loginUser">Add to Cart</a>
		</c:when>
		<c:otherwise>
		<a class="btn btn-primary" href="<c:url value='cart/add/${catprolist.pro_id}' />">Add to Cart</a>
		</c:otherwise>
	</c:choose>
								
								
									
									</p>
									<p> 
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

						</div>
					</div>
					</c:forEach>
				
				</c:if>
        
 
        </div>
      </div>
      <div class="col-md-1">
      </div>
    </div>

<br>



</body>
</html>