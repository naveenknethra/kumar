<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Product page</title>
</head>
<body>

<jsp:include page="adminhome.jsp"></jsp:include>

</br>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-xs-5 col-sm-5 col-md-5">
      <center>
      <h3>Add a Product</h3>
      <br>
      </center>

     <form:form action="addproduct" commandName="product" enctype="multipart/form-data">
      
      <label  class="col-sm-4 control-label">Product id</label>
          <div class="col-sm-8">
           
           <c:if test="${!empty product.pro_id}">
            <form:input path="pro_id" cssClass="form-control" placeholder="Product_Id" value="${product.pro_id}" readonly="true" />
          </c:if>
          
           <c:if test="${empty product.pro_id}">
            <form:input path="pro_id" cssClass="form-control" placeholder="Product_Id" />
          </c:if>
          </div></br></br>
      
       <label  class="col-sm-4 control-label">Name</label>
          <div class="col-sm-8">
            <%--<input type="text" class="form-control" id="inputID" placeholder="ID"> --%>
            <form:input path="pro_name" cssClass="form-control" placeholder="Product_Name" value="${product.pro_name}"/>
          </div></br></br>
        
         <div class="form-group">
          <label  class="col-sm-4 control-label">Description</label>
          <div class="col-sm-8">
            <!--<input type="text" class="form-control" id="inputName" placeholder="Address">  -->
        <form:input path="pro_desc" cssClass="form-control" placeholder="Product_Description" value="${product.pro_desc}"/>
          </div>
        </div></br></br>
      
      <div class="form-group">
          <label  class="col-sm-4 control-label">Stock</label>
          <div class="col-sm-8">
            <!-- <input type="text" class="form-control" id="inputName" placeholder="Stock"> -->
     <form:input path="stock" cssClass="form-control" placeholder="Product_Stock" value="${product.stock}"/>       
          </div>
        </div></br></br>
        
         <div class="form-group">
          <label  class="col-sm-4 control-label">Price</label>
          <div class="col-sm-8">
           <!-- <input type="text" class="form-control" id="inputInt" placeholder="Price"> -->
           <form:input path="price" cssClass="form-control" placeholder="Price" value="${product.price}" /> 
          </div>
        </div></br></br>
        
        
         <div class="form-group">
          <label  class="col-sm-4 control-label">Supplier-Name</label>
          <div class="col-sm-8">
           <!-- <input type="text" class="form-control" id="inputID" placeholder="Supplier-ID"> -->
           <form:select path="supplier.sup_name" itemValue="sup_name" itemLabel="sup_name" items="${supplierList}"/>
            </div>
        </div></br>
        
         <div class="form-group">
          <label class="col-sm-4 control-label">Category-Name</label>
          <div class="col-sm-8">
            <!-- <input type="text" class="form-control" id="inputID" placeholder="Category-ID"> -->
            <form:select path="category.cat_name" itemValue="cat_name" itemLabel="cat_name" items="${categoryList}"/>
          </div>
        </div></br>
        
         <div class="form-group">
          <form:label path="image" class="col-sm-4 control-label"><spring:message text="Select Image"></spring:message></form:label>
         <div class="col-sm-8">
         <form:input type="file" path="image"/>
        </div></div></br>
        
        <c:if test="${!empty product.pro_name}">
          <center>
  <button class="btn btn-sm btn-primary btn-block btn-success" type="submit">
  EDIT PRODUCT
  </button>
  </center></c:if>
  
   <c:if test="${empty product.pro_name}">
          <center>
  <button class="btn btn-sm btn-primary btn-block btn-success" type="submit">
  ADD PRODUCT
  </button>
  </center></c:if>
        
      </form:form> 
      
      </div>
        </div>
        
      <div class="row">
            <div class="col-md-1"></div>
             <div class="col-md-2">
     <a href="productdetails-{pro_id}">Show Products</a></div></div>
      
        <center>
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-2">
              <h3>Product List</h3>
            </div>
          </center>
  <br>
  
   <div class="container">
    <div class="row">
<div id="product" div class="table-responsive">
      <table class="table  table-hover table-striped
      table-bordered">
      <thead>
        <tr class="primary">
          <th>Product Id</th>
          <th>Name</th>
          <th>Description</th>
          <th>Price</th>
          <th>Image</th>
          <th>Stock</th>
          <th>Supplier Name</th>
          <th>Category Name</th>
          <th>EDIT</th>
          <th>DELETE</th>
          </tr>
          </thead>
          <tbody>
          <c:if test="${!empty productList}">
          <c:forEach items="${productList}" var="plist">
        <tr class="danger">
          <td>${plist.pro_id}</td>
          <td>${plist.pro_name}</td>
          <td>${plist.pro_desc}</td>
          <td>${plist.price}</td>
          <td><img src="resources/images/${plist.pro_id}.jpg" style="width:100px; height: 150px;"></td>
          <td>${plist.stock}</td> 
         <td>${plist.supplier.sup_name}</td>
          <td>${plist.category.cat_name}</td>
          
          <td><a href="product-edit-${plist.pro_id}"><button type="button" class="btn btn-primary">EDIT</button></a></td>
          <td><a href="productdelete-${plist.pro_id}"><button type="button" class="btn btn-danger">DELETE</button></a></td>
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