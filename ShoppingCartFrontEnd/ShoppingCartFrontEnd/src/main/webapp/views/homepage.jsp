<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page session= "false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping:My Mobiles.com
</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/styles/bootstrap.css">
<script src="resources/scripts/ajaxjquery.js"></script>
<script src="resources/scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value="resources/styles/home.css"/>">
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 600%;
      margin: auto;
}

body{ 
background-image: url(resources/images/back11.jpg); 
background-size:     cover;                      
    background-repeat:   no-repeat;
 } 

 
</style>

</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>

  <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  <li data-target="#myCarousel" data-slide-to="1"></li>
  <li data-target="#myCarousel" data-slide-to="2"></li>
  <li data-target="#myCarousel" data-slide-to="3"></li>
  <li data-target="#mycorousel" data-slide-to="4"></li>
  <li data-target="#mycorousel" data-slide-to="5"></li>
  <li data-target="#mycorousel" data-slide-to="6"></li>
  <li data-target="#mycorousel" data-slide-to="7"></li>
  <li data-target="#mycorousel" data-slide-to="8"></li>
  <li data-target="#mycorousel" data-slide-to="9"></li>
  <li data-target="#mycorousel" data-slide-to="10"></li>
<li data-target="#mycorousel" data-slide-to="11"></li>
<li data-target="#mycorousel" data-slide-to="12"></li>
<li data-target="#mycorousel" data-slide-to="13"></li>
<li data-target="#mycorousel" data-slide-to="14"></li>

  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  <div class="item active">
  <!-- Set the first background image using inline CSS below  -->
  <img src="resources/images/slide30.jpg" alt="slide11" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide31.jpg" alt="slide12" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide32.jpg" alt="slide13" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide29.jpg" alt="slide14" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide34.jpg" alt="slide16" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide35.jpg" alt=slide15" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide38.jpg" alt="slide17" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide39.jpg" alt="slide18" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide40.jpg" alt="slide19" width="600" height="345">
  </div>

  <div class="item">
  <img src="resources/images/slide27.jpg" alt="slide20" width="600" height="345">
  </div>

<div class="item">
<img src="resources/images/slide25.jpg" alt="slide14" width="600" height="345">
</div>

<div class="item">
<img src="resources/images/slide24.jpg" alt="slide24" width="600" height="345">
</div>

<div class="item">
<img src="resources/images/slide23.jpg" alt="slide23" width="600" height="345">
</div>

<div class="item">
<img src="resources/images/slide22.jpg" alt="slide22" width="600" height="345">
</div>

<div class="item">
<img src="resources/images/slide21.jpg" alt="slide21" width="600" height="345">
</div>


  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  <span class="sr-only">Next</span>
  </a>
</div></div></div>
<br><br>

  <div class="row">
      <div class="col-md-1">
      </div>
      <div class="col-md-10">
        <div class="row">
        
      <c:if test="${!empty hprolist}">
		
					<c:forEach items="${hprolist}" var="homeprolist">	
					<div class="col-md-3">
						<div class="thumbnail"><br>
							<img alt="Bootstrap Thumbnail First"
								src="resources/images/${homeprolist.pro_id}.jpg" href="<c:url value='homepro${homeprolist.pro_id}' />" />
							<div class="caption">
								<h3>${homeprolist.pro_name}</h3>
								<h5>Rs ${homeprolist.price}</h5>
								<p>
									<a class="btn btn-primary" href="<c:url value='homepro${homeprolist.pro_id}' />">More</a> 
									
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


 
<br>
<jsp:include page="footer.jsp"></jsp:include>
<br>

</body>
</html>