<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Supplier Page</title>
</head>
<body>

<jsp:include page="adminhome.jsp"></jsp:include>

</br>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-xs-4 col-sm-4 col-md-4">
      <center>
        <h3>Add a Supplier</h3>
      </center>
      

 <form:form action="addsupplier" commandName="supplierpage">
        
         <div class="form-group">
          <label for="ID" class="col-sm-4 control-label">Supplier id</label>
          <div class="col-sm-8">
        
        <c:if test="${!empty supplier.sup_id}">
         <form:input path="sup_id" cssClass="form-control" placeholder="Supplier_ID" value="${supplier.sup_id}" readonly="true"/>	
          </c:if>
          <c:if test="${empty supplier.sup_id}">
         <form:input path="sup_id" cssClass="form-control" placeholder="Supplier_ID" />	
          </c:if>
          
          </div>
        </div></br></br>
        
        <div class="form-group">
          <label for="ID" class="col-sm-4 control-label">Name</label>
          <div class="col-sm-8">
         <!-- <input type="text" class="form-control" id="inputID" placeholder="ID"> -->
         <form:input path="sup_name" cssClass="form-control" placeholder="Supplier_Name" value="${supplier.sup_name}"/>	
          </div>
        </div></br></br>

        <div class="form-group">
          <label for="name" class="col-sm-4 control-label">Address</label>
          <div class="col-sm-8">
        <!-- <input type="text" class="form-control" id="inputName" placeholder="Name"> -->
        <form:input path="address" cssClass="form-control" placeholder="Supplier_Address" value="${supplier.address}"/>    
          </div>
        </div></br></br>
        
        <c:if test="${!empty supplier.sup_name}">
            <center>
  <button class="btn btn-sm btn-primary btn-block btn-success" type="submit">
  EDIT SUPPLIER
  </button>
  </center>
  </c:if>
  
    <c:if test="${empty supplier.sup_name}">
            <center>
  <button class="btn btn-sm btn-primary btn-block btn-success" type="submit">
  ADD SUPPLIER
  </button>
  </center>
  </c:if>
  
  </form:form>
  
  

</div>
 </div>
    
         <center>  
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-2">
              <h3>Supplier List</h3>
            </div>
          </center>
          
  <br>
  <div class="container">
    <div class="row">
<div class="supplier" div class="table-responsive">
      <table class="table  table-hover table-striped
      table-bordered">
      <thead>
        <tr class="primary">
          <th>Supplier Id</th>
          <th>Supplier Name</th>
          <th>Supplier Address</th>
          <th>Edit</th>
          <th>Delete</th>
          </tr>
          </thead>
          <tbody>
          <c:if test="${!empty supplierList}">
          <c:forEach items="${supplierList}" var="slist">
        <tr class="danger">
          <td>${slist.sup_id}</td>
          <td>${slist.sup_name}</td>
          <td>${slist.address}</td>
 <td><a href="<c:url value="supplieredit-${slist.sup_id}"/>"><button type="button" class="btn btn-primary">EDIT</button> </a></td>				
 <td><a href="<c:url value="supplierdelete/${slist.sup_id}"/>"><button type="button" class="btn btn-danger">DElETE</button> </a></td>         
          
          
        </tr>
        </c:forEach>
        </c:if>
        </tbody>
  </table>
  </div>
  </div>
  </div>

</body>
</html>