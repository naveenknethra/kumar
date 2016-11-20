<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>manage category</title>
</head>
<body>

	<jsp:include page="adminhome.jsp"></jsp:include>
	</br>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-xs-4 col-sm-4 col-md-4">
			<center>
				<h3>Add a Category</h3>
			</center>


			<form:form action="addcategory" commandName="categorypage">



				<div class="form-group">
					<label for="ID" class="col-sm-4 control-label">Category id
					</label>
					<div class="col-sm-8">
					
					<c:if test="${!empty category.cat_id}">
						<form:input path="cat_id" cssClass="form-control"
							placeholder="Categoty_ID" value="${category.cat_id}"
							readonly="true" />
					</c:if>
					<c:if test="${empty category.cat_id}">
						<form:input path="cat_id" cssClass="form-control"
							placeholder="Categoty_ID" />
					</c:if>
					</div>
				</div>
				</br>
				</br>


				<div class="form-group">
					<label for="ID" class="col-sm-4 control-label">Name </label>
					<div class="col-sm-8">
						<form:input path="cat_name" value="${category.cat_name}"
							cssClass="form-control" placeholder="Categoty_Name" />
					</div>
				</div>
				</br>
				</br>


				<div class="form-group">
					<label for="name" class="col-sm-4 control-label">Description</label>

					<div class="col-sm-8">
						<form:input path="description" value="${category.description}"
							cssClass="form-control" placeholder="Category_Description" />
					</div>
				</div>
				</br>
				</br>


				<c:if test="${!empty category.cat_name}">
					<center>
						<button class="btn btn-sm btn-primary btn-block btn-success"
							 type="submit">EDIT CATEGORY</button>
					</center>
				</c:if>

				<c:if test="${empty category.cat_name}">
					<center>
						<button class="btn btn-sm btn-primary btn-block btn-success"
							 type="submit">ADD CATEGORY</button>
					</center>
				</c:if>
			</form:form>

		</div>
	</div>

	<center>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<h3>Category List</h3>
			</div>
	</center>


	<div class="container">
		<div class="row">
			<div id="category" div class="table-responsive">
				<table
					class="table  table-hover table-striped
      table-bordered">
					<thead>
						<tr class="primary">
							<th>Category Id</th>
							<th>Category Name</th>
							<th>Category Description</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty categoryList}">
							<c:forEach items="${categoryList}" var="clist">
								<tr class="danger">
									<td>${clist.cat_id}</td>
									<td>${clist.cat_name}</td>
									<td>${clist.description}</td>
									<td><a
										href="<c:url value="categoryedit-${clist.cat_id}"/>"><button
												type="button" class="btn btn-primary">EDIT</button> </a></td>
									<td><a
										href="<c:url value="categorydelete/${clist.cat_id}"/>"><button
												type="button" class="btn btn-danger">DElETE</button> </a></td>

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