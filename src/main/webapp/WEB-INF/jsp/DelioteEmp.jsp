<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- FINAL PRODUCT -->


<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>




<style>
#addEmp {
	width: 150px;
	height: 40px;
	background-color: black;
	transition: 0.3s;
}

#addEmp:hover {
	border-color: white;
	border-radius: 13px;
}

#empLink {
	font-size: 15px;
	color: white;
	text-decoration: none;
	font-family: monospace;
}

#noDesigBtn {
	position: absolute;
	left: 98%;
	top: 1%;
	width: 60px;
	height: 40px;
	background-color: black;
	color: white;
	border: 1px solid white;
	transition: 0.3s;
}

#noDesigBtn:hover {
	background-color: white;
	color: black;
	border: 2px solid black;
}
#heading {
	position: absolute;
	top: 20%;
	font-family:  Times New Roman;
}

#tablecnt {
	position: absolute;
	top: 25%;
}
#companyDropdown {
	position: absolute;
	top: 14%;
} 
#dropdownSearch{
	width: auto;
	height: 30px;
	background-color: #0d6efd;
	color: white;
	border-radius: 12px;
	transition: 0.3s;
	border: none;
}
#dropdownSearch:hover{
	background: white;
	color: black;
	border: 1px solid black;
}
</style>


<!-- NAB BAR -->
<nav class="navbar bg-primary">
	<div class="container-fluid ">
		<span class="navbar-brand mb-0 h1" style="color: white;">Deliote
			</span>
			<a href="http://localhost:8080/SpringMVCPagination/"><button type="button" class="btn btn-danger">Logout</button></a>
	</div>
</nav>

<h3 id="heading">Employee Details</h3>

<!-- EMPLOYEE TABLE -->

<table class="table table-hover " id="tablecnt">
	<thead>
		<tr>
			<th>Employee Code</th>
			<th>Name</th>
			<th>Salary</th>
			<th>Designation</th>
			<th>Edit</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dltemp" items="${Deliotelist}">
			<tr>
				<td class="emplId">${dltemp.id}</td>
				<td class="emplName">${dltemp.name}</td>
				<td class="emplSalary">${dltemp.salary}</td>
				<td><a href="#" class="editIcon" onclick="editEmployee(${dltemp.id})"><i class="bi bi-pencil-square"></i></a></td>
				<td><i
						class="bi bi-trash3-fill" style="color: red;" data-bs-toggle="modal" data-bs-target="#deletemodal"></i></td>
			</tr>
			
			
				<!-- Delete Modal -->	
					<div class="modal fade" id="deletemodal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>Are you sure you want to delete
									<p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<a href="deleteDeliote/${dltemp.id}"><button type="button"
											class="btn btn-danger" >Delete</button></a>
								</div>
							</div>
						</div>
					</div>
				
		</c:forEach>
	</tbody>
</table>
<br />


<!-- MODAL TO ADD EMPLOYEE TO DATABASE -->

<!-- Button modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#dltAddEmp" style="position: absolute; top:80%;">Add Employee</button>

<!-- Modal -->
<div class="modal fade" id="dltAddEmp" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="dltForm" method="post" action="saveDeliote" name="dltForm">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label> <input
							type="text" class="form-control" id="name" name="name" required>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Designation</label> 
						<select  class="form-control" id="salary" name="salary">
								<c:forEach var="d" items="${desig}"><option value="${d.designation}" >${d.designation}</option></c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">salary</label> <input
							type="text" class="form-control" id="designation"
							name="designation"required>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- HANDLER FOR THE FORM SUBMISSION  -->
<script>
	$(document).ready(function() {
	$('#dltForm').submit(
	function(event) {
	 event.preventDefault();
	 var name = $('#name').val();
	 var designation = $('#designation').val();
	 var salary = $('#salary').val();
	  $.ajax({
		url : 'save',
		type : 'POST',
		data : {
			'name' : name,
			'designation' : designation,
			'salary' : salary
				},
			success : function(response) {
			window.location.href = "http://localhost:8080/SpringMVCPagination/delioteEmp";
				}
				});
				});
});
</script>


<div class="dropdown" id="companyDropdown">
  <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    Deliote
  </a>

  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="http://localhost:8080/SpringMVCPagination/viewemp">Delta</a></li>
    <li><a class="dropdown-item" href="http://localhost:8080/SpringMVCPagination/tcsEmp">Tcs</a></li>
    <li><a class="dropdown-item" href="http://localhost:8080/SpringMVCPagination/delioteEmp">Deliote</a></li>
  </ul>
</div>



<!-- EIDT MODAL -->

<!-- Modal -->
<div class="modal fade" id="editMdl" tabindex="-1" aria-labelledby="editMdlLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editMdlLabel">Edit Employee Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalBody">
        <form id="edtForm"  action="save">
        	 <input type="hidden" name="id" id="idField"  />
          <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="nameField" name="name" required/>
          </div>
          <div class="mb-3">
            <label for="age" class="form-label">designation</label>
             <select class="form-control" id="desigField" name="designation" required>
				<c:forEach var="d" items="${desig}">
					<option value="${d.designation}">${d.designation}</option>
				</c:forEach>
			 </select>
          </div>
          <div class="mb-3">
            <label for="salary" class="form-label">Salary</label>
            <input type="number" class="form-control" id="salaryField" name="salary" required/>
          </div>
          
          
            
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEdit()">Save changes</button>
      </div>
    </div>
  </div>
</div>
	



<script>
function editEmployee(id) {
	
	
	 $(".editIcon").click(function () {
		 
		    var id = $(this).parents("tr").find(".emplId").text();
			var name = $(this).parents("tr").find(".emplName").text();
			var salary = $(this).parents("tr").find(".emplSalary").text();
			var desig = $(this).parents("tr").find(".emplDesig").text();
			
			console.log(name);
			console.log(salary);
			console.log(desig);
			  $('#idField').val(id);
			  $('#nameField').val(name);
			  $('#salaryField').val(salary);
			  $('#desigField').val(desig);
			  


	 });


    $("#editMdl").modal("show"); 
}

</script>

<script>

function submitEdit() 
{
    var form = $("#edtForm");
    console.log(form);
    $.ajax({
        url: "http://localhost:8080/SpringMVCPagination/editDeliotesave",
        type: "GET",
        data: form.serialize(),
        success: function() {
            $("#editMdl").modal("hide");
            window.location.href = "http://localhost:8080/SpringMVCPagination/delioteEmp";
            // ...
        },
        error: function() {
            alert("Failed to update employee.");
        }
    });
}

</script>