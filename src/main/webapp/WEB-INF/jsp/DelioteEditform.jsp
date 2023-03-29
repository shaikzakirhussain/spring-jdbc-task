<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>
#crd {
	margin-top: 20px;
	margin-left: 20px;
	box-shadow: 1px 1px 1px 1px #D4D4D4
}

#btn {
	width: 80px;
	height: 30px;
	background-color: black;
	color: white;
	margin-top: 6px;
	transition: 0.3s;
}

#btn:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>


<!-- Nav Bar -->
<nav class="navbar bg-primary">
	<div class="container-fluid ">
		<span class="navbar-brand mb-0 h1" style="color: white;">Edit Employee Details</span>
	</div>
</nav>





<div class="card" style="width: 28rem;" id="crd">
	<div class="card-body">
		<h4 class="card-title">Edit Employee</h4>
		<form:form method="POST" action="/SpringMVCPagination/editDeliotesave">
			<table>
				<tr>
					<td></td>
					<td><form:hidden path="id" /></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><form:input path="name"  /></td>
				</tr>
				<tr>
					<td>salary :</td>
					<td><form:input path="salary" /></td>
				</tr>
				<tr>
					<td>Designation:</td>
					<td><form:input path="designation" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Edit Save" / id="btn"></td>
				</tr>
			</table>
		</form:form>
	</div>
</div>


</body>
</html>