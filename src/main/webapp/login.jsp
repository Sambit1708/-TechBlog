<%@ page import="com.tech.blog.entites.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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


	<main class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-bg text-white">
							<h3 class="text-center">Login Here</h3>
						</div>

						<%
							HttpSession msgSession = request.getSession();
							Message msg = (Message)msgSession.getAttribute("msg");
							
							if(msg != null) {
								String cssClass = msg.getCssClass();
						%>
							<div class="alert <%= cssClass%>" role="alert"><%= msg.getContent()%>
							</div>
						<%
								request.getSession().removeAttribute("msg");
							}
							
						%>
						<div class="card-body">
							<form action="LoginServlet" method="POST">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" required name="user_email"
										class="form-control" id="exampleInputEmail1">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" required name="user_password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-success">Submit</button>
									<button type="reset" class="btn btn-warning">Reset</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous">
		
	</script>
	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>