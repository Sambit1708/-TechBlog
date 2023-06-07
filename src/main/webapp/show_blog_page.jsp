<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.entites.Message"%>
<%@page import="com.tech.blog.entites.User"%>
<%@page import="com.tech.blog.entites.Post"%>
<%@page import="com.tech.blog.entites.Categories"%>
<%@page import="com.tech.blog.doa.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.Helper"%>
<%@ page errorPage="error_page.jpg"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Details Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom Style -->
<link href="css/style.css" type="text/css" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
	.post-content {
		font-weight: 100;
		font-size: 25px;
	}
</style>
</head>
<body>
	<%
		User user = (User) session.getAttribute("currentUser");
		if (user == null)
		response.sendRedirect("login.jsp");
		int pId = Integer.parseInt(request.getParameter("post_id"));
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		Post posts = postDao.getPostDetailById(pId);
		
	%>
	<!-- NavBar Start -->

	<%@ include file="navbar.jsp" %>

	<!-- NavBar End -->
	
	<!-- Main Content -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-2">
					<div class="card-header text-white primary-bg">
						<h4><%=posts.getpTitle() %></h4>
					</div>
					<div class="card-body">
					<img alt="<%=posts.getpPic() %>" src="pics/<%=posts.getpPic() %>" class="card-img-top my-2" style="height: 300px;">
						
						<div class="row my-3" style="border: 1px solid #e2e2e2; padding-top: 15px">
							<div class="col-md-7">
								<p><a href="#!"><%=user.getUsername() %></a> have posted.</p>
							</div>
							<div class="col-md-5">
								<p style="font-size: 15px;"><b><%= DateFormat.getDateTimeInstance().format(posts.getpDate()) %></b></p>
							</div>
						</div>
						
						<p class="post-content"><%= posts.getpContext() %></p>
						<br>
						<br>
						<div class="post-code">
							<pre><%=posts.getpCode() %></pre>
						</div>
					</div>
					<div class="card-footer text-center primary-bg text-white">
						<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i>&nbsp;<span>10</span></a>
						<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i>&nbsp;<span>20</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Main Content -->
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	</script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous">
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>