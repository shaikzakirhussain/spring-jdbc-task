

<!-- <a href="empform">Add Employee</a>
<a href="viewemp">View Employees</a>
<a href="dropdown">View dropdown Menu</a>
 -->


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com"
	crossorigin="crossorigin">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Alkatra&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/0d56f5132b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
	crossorigin="anonymous"></script>


<title>Employee Search</title>

<style>
#navBar {
	box-shadow: 0px 2px 12px 1px grey;
}

.btn-color {
	background-color: #0e1c36;
	color: #fff;
}

.profile-image-pic {
	object-fit: cover;
}

.cardbody-color {
	background-color: #ebf2fa;
}

a {
	text-decoration: none;
}

/* Modal Container */
.modal {
	display: none;
	z-index: 1;
	left: 0;
	top: 0;
	width: 150%;
	height: 150%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content Box */
.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
}

/* Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

/* Close Button Hover */
.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navBar">
		<!-- Container wrapper -->
		<div class="container">
			<!-- Navbar brand -->
			<i class="fa-solid fa-train" style="font-size: 25px;"></i> </a>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarButtonsExample">
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#"
						style="font-family: 'Alkatra', cursive; font-size: 23px; color: black;">Employee
							Search Engine</a></li>
				</ul>
				<!-- Left links -->

				<div class="d-flex align-items-center">
					<!-- <button type="button" class="btn btn-link px-3 me-2"> Login </button> -->

				</div>
			</div>

		</div>
	</nav>

	<div class="container" id="dashArea">
		<h2 style="margin-top: 27px;">Dashboard</h2>


		<div class="row" style="margin-top: 30px;">

			<!-- Delta -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow h-100 py-2"
					style="border-left: 4px solid blue;">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-uppercase mb-1">
									<a href="#" onclick="loginButton()"
										style="text-decoration-color: blue; color: blue; text-decoration: none;">Delta
										Technologies </a>
									<!-- <button onclick="login()">test</button> -->
								</div>

							</div>
							<div class="col-auto">
								<i class="fa-solid fa-calendar-days"
									style="color: #e6e5e5; font-size: 30px;"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--TCS -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow h-100 py-2"
					style="border-left: 4px solid rgb(37, 230, 37);">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-uppercase mb-1">
									<a href="#" onclick="loginButton()"
										style="text-decoration: none; text-decoration-color: rgb(37, 230, 37); color: rgb(37, 230, 37);">Tata
										Consultancy Services</a>
								</div>
							</div>
							<div class="col-auto">
								<i class="fa-solid fa-dollar-sign"
									style="color: #e6e5e5; font-size: 30px;"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- DELIOITE -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow h-100 py-2"
					style="border-left: 4px solid rgb(183, 39, 227);">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold  text-uppercase mb-1">
									<a href="delioteEmp"
										style="text-decoration: none; text-decoration-color: rgb(183, 39, 227); color: rgb(183, 39, 227);">Deliote</a>
								</div>
								<div class="row no-gutters align-items-center"></div>
							</div>
							<div class="col-auto">
								<i class="fa-solid fa-comments"
									style="color: #e6e5e5; font-size: 30px;"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- LOGIN MODAL  -->


	<div id="loginModal" class="modal">
		<div class="modal-content">
			<form>

				<div class="text-center">
					<img
						src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png"
						class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
						width="auto" alt="profile">
				</div>

				<div class="mb-3">
					<input type="text" class="form-control" id="username"
						name="username" aria-describedby="emailHelp"
						placeholder="User Name"> <span id="invUser" name="invUser"
						style="color: red; display: none;">invalid username</span>
				</div>
				<div class="mb-3">
					<input type="password" class="form-control" id="password"
						placeholder="password" name="password"> <span id="invPass"
						name="invPass" style="color: red; display: none;">invalid
						password</span>

				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-color px-5 mb-5 w-100">Login</button>
				</div>
			</form>




		</div>
	</div>

	<script>


// When the user submits the login form, do something
 /*
 */
function loginButton(){
	//Get the modal
	 var modal = document.getElementById("loginModal");

	 // Get the button that opens the modal
	 var btn = document.getElementById("loginButton");

	 // When the user clicks the button, open the modal
	
	 modal.style.display = "block";

	 // When the user clicks anywhere outside of the modal, close it
	 window.onclick = function(event) {
	 if (event.target == modal) {
	 modal.style.display = "none";
	 }
	 }
	 
	 document.querySelector('form').addEventListener('submit', function (e) {
	        e.preventDefault();
	        var username = document.querySelector('#loginModal form #username').value;
	        var password = document.querySelector('#loginModal form #password').value;

	        if (username === 'delta' && password === '1234') {
	            window.location.href = "http://localhost:8080/SpringMVCPagination/viewemp";
	        } else if (username === 'tcs' && password === '0101') {
	            window.location.href = "http://localhost:8080/SpringMVCPagination/tcsEmp";
	        } else if (username === 'deliote' && password === '007') {
	            window.location.href = "http://localhost:8080/SpringMVCPagination/delioteEmp";
	        } else {
	            alert("invalid user check your credentails")
	        }

	    });
}



</script>
</body>
</html>