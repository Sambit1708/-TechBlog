<%@ page import="com.tech.blog.entites.Message"%>
<%@page import="com.tech.blog.entites.User"%>
<%@ page errorPage="error_page.jpg"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null)
	response.sendRedirect("login.jsp");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom Style -->
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- NavBar Start -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i class="fa fa-tumblr-square"></i>
				Tech Blog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse d-flex justify-content-between"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i class="fa fa-home"></i>
							Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa fa-check-square"></i> Categories
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Java Servlet J2EE</a></li>
							<li><a class="dropdown-item" href="#">Hibernate</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Spring Boot</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Contact</a>
					</li>
				</ul>
				<ul class="navbar-nav r-0">
					<li class="nav-item"><a href="#!" data-bs-toggle="modal"
						data-bs-target="#profile-modal" class="nav-link active"> <i
							class="fa fa-user-circle"></i>&nbsp;<%=user.getUsername()%></a></li>
					<li class="nav-item active"><a href="LogoutServlet"
						class="nav-link"> <i class="fa fa-user"></i>&nbsp;Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- NavBar End -->
	<%
	HttpSession msgSession = request.getSession();
	Message msg = (Message) msgSession.getAttribute("msg");

	if (msg != null) {
		String cssClass = msg.getCssClass();
	%>
	<div class="alert <%=cssClass%>" role="alert"><%=msg.getContent()%>
	</div>
	<%
	request.removeAttribute("msg");
	}
	%>
	<!-- Profile Modal Start -->

	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-bg text-white">
					<h5 class="modal-title text-uppercase" id="exampleModalLabel">My
						Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/ProfileImg.jpg" class="img-fluid"
							style="height: 200px; border-radius: 50%;">
						<h5><%=user.getUsername()%></h5>
						<div id="profile-details">
							<h3 class="mt2">Profile Details</h3>
							<table class="table table-striped">
								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">User Name:</th>
										<td><%=user.getUsername()%></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About:</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered:</th>
										<td><%=user.getDate()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profile Edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt2">Please Edit Carefully</h3>
							<form action="EditSerlet" method="POST"
								enctype="multipart/form-data">
								<table class="table table-striped">
									<tbody>
										<tr>
											<th scope="row">ID:</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Email:</th>
											<td><input type="email" class="form-control"
												name="user_email" value="<%=user.getEmail()%>"></td>
										</tr>
										<tr>
											<th scope="row">User Name:</th>
											<td><input type="text" class="form-control"
												name="user_name" value="<%=user.getUsername()%>"></td>
										</tr>
										<tr>
											<th scope="row">About:</th>
											<td><textarea class="form-control" name="user_about"><%=user.getAbout()%></textarea></td>
										</tr>
									</tbody>
								</table>
								<button type="submit" class="btn btn-primary">Update</button>
							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="profile-edit-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Profile Modal End -->




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	</script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous">
		
	</script>
	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>