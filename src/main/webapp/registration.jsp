<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom Style -->
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>


	<!-- Navigation bar -->
	<%@ include file="navbar.jsp"%>


	<main class="d-flex align-items-center" style="height: 100vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-bg text-white">
							<h3 class="text-center text-uppercase">Sign Up</h3>
						</div>
						<div class="card-body">
							<form action="RegisterServlet" method="POST" id="regisForm">
								<div class="form-group">
									<label for="InputName" class="form-label">User Name</label> <input
										type="text" class="form-control" id="InputName"
										name="user_name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" name="user_email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" class="form-control"
										id="exampleInputPassword1" name="user_password">
								</div>
								<div class="radio Container d-flex">
									<label for="radioGender" class="form-label">Gender: </label>
									<div class="form-check ml-3">
										<input class="form-check-input" type="radio" name="gender"
											value="Male" id="male" checked> <label
											class="form-check-label" for="flexRadioDefault1">
											Male </label>
									</div>
									<div class="form-check ml-3">
										<input class="form-check-input" value="Female" type="radio"
											name="gender" id="female"> <label
											class="form-check-label" for="flexRadioDefault2">
											Female </label>
									</div>
								</div>
								<div class="form-group">
									<textarea name="about" class="form-control" id="aboutForm"
										rows="5" placeholder="Enter Something about yourselfs"></textarea>
								</div>
								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name="check"> <label
										class="form-check-label" for="exampleCheck1">Agree to
										our Terms & Condition</label>
								</div>
								<div class="container text-center" id="loader"
									style="display: none;">
									<i class="fa fa-refresh fa-spin fa-4x"></i>
									<h4>Please Wait...</h4>
								</div>
								<div class="text-center">
									<button id="submit-btn" type="submit" class="btn btn-success">Submit</button>
									<button id="reset-btn" type="reset" class="btn btn-warning">Reset</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous">
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>