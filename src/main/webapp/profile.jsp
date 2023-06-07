<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.entites.Message"%>
<%@page import="com.tech.blog.entites.User"%>
<%@page import="com.tech.blog.entites.Categories"%>
<%@page import="com.tech.blog.doa.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="error_page.jpg"%>
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Custom Style -->
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- NavBar Start -->

	<%@ include file="navbar.jsp" %>

	<!-- NavBar End -->
	<%
		HttpSession msgSession = request.getSession();
		Message msg = (Message) msgSession.getAttribute("msg");
		if (msg != null) {
			String cssClass = msg.getCssClass();
	%>
	<div class="alert <%=cssClass%>" role="alert"><%=msg.getContent()%></div>
	<%
		request.getSession().removeAttribute("msg");
	}
	%>


	<!-- Latest Post -->

	<main>
		<div class="container">
			<div class="row">
				<!-- First col -->
				<div class="col-md-4 mt-5">
					<!-- categories -->
					<div class="list-group">
						<button type="button"
							class="c-link list-group-item list-group-item-action active"
							onClick="loadPosts(0, this)">All Posts</button>
						<%
							PostDao postdaotemp = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Categories> categories = postdaotemp.getAllCategories();
							if (categories != null) {
								for (Categories cat : categories) {
						%>
						<button type="button"
							class="c-link list-group-item list-group-item-action"
							id="categories-select"
							onClick="loadPosts(<%=cat.getCid()%>, this)"><%=cat.getName()%></button>
						<%
								}
							}
						%>
					</div>
				</div>

				<!-- First col -->
				<div class="col-md-8">
					<!-- post -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading....</h3>
					</div>
					<div class="container container-fluid" id="post-container"></div>
				</div>
			</div>
		</div>
	</main>

	<!-- Latest Post -->


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