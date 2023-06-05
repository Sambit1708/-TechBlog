<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Custom Style -->
	<link href="css/style.css" type="text/css" rel="stylesheet" >
	

</head>
<body>
	<!-- Navigation bar -->
	<%@ include file="navbar.jsp" %>

	
	<!--  Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-bg text-white" style="clip-path: polygon(100% 0, 100% 71%, 92% 82%, 80% 91%, 64% 96%, 45% 100%, 28% 94%, 14% 94%, 0 99%, 0 0);">
			<div class="container">
				<h3>Welcome to TechBlog</h3>
				<p class="font-monospace">Objects can be obtained by means of either dependency lookup or dependency injection.[24] Dependency lookup is a pattern where a caller asks the container object for an object with a specific name or of a specific type. Dependency injection is a pattern where the container passes objects by name to other objects, via either constructors, properties, or factory methods.</p>
				<button class="btn btn-gold regisnav"><i class="fa fa-external-link"></i>&nbsp;Free Registration!</button>
				<button class="btn btn-outline-light lognav">Login!</button>
			</div>
		</div>
	</div>
	
	
	<!-- Card -->
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Read More...</a>
				  </div>
				</div>
			</div>
		</div>
	</div>










	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" 
			crossorigin="anonymous">
	</script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
			integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
			crossorigin="anonymous">
	</script>
	<script src="js/myJs.js"type="text/javascript"></script>
</body>
</html>