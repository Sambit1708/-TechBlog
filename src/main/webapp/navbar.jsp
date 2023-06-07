<%@page import="com.tech.blog.entites.User"%>
<%@page import="com.tech.blog.doa.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entites.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa fa-tumblr-square"></i> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa fa-home"></i> Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fa fa-check-square"></i> Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Java Servlet J2EE</a></li>
            <li><a class="dropdown-item" href="#">Hibernate</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Spring Boot</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Contact</a>
        </li>
        <%
        	HttpSession navSession = request.getSession();
        	User navuser  = (User)navSession.getAttribute("currentUser");
        	if(navuser == null) {
        %>
        	<li class="nav-item">
	          <a href="login.jsp" class="nav-link">Login</a>
	        </li>
	        <li class="nav-item">
	          <a href="registration.jsp" class="nav-link">Sign Up</a>
	        </li>
        </ul>
        <%
        	} else {
        %>
        	<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#post-modal"><i
						class="fa fa-asterisk">&nbsp;Do Post</i></a></li>
			</ul>
			<ul class="navbar-nav r-0">
				<li class="nav-item"><a href="#!" data-bs-toggle="modal"
					data-bs-target="#profile-modal" class="nav-link active"> <i
						class="fa fa-user-circle"></i>&nbsp;<%=navuser.getUsername()%></a></li>
				<li class="nav-item active"><a href="LogoutServlet"
					class="nav-link"> <i class="fa fa-user"></i>&nbsp;Logout
				</a></li>
			</ul>
			
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
								<h5><%=navuser.getUsername()%></h5>
								<div id="profile-details">
									<h3 class="mt2">Profile Details</h3>
									<table class="table table-striped">
										<tbody>
											<tr>
												<th scope="row">ID:</th>
												<td><%=navuser.getId()%></td>
											</tr>
											<tr>
												<th scope="row">Email:</th>
												<td><%=navuser.getEmail()%></td>
											</tr>
											<tr>
												<th scope="row">User Name:</th>
												<td><%=navuser.getUsername()%></td>
											</tr>
											<tr>
												<th scope="row">Gender:</th>
												<td><%=navuser.getGender()%></td>
											</tr>
											<tr>
												<th scope="row">About:</th>
												<td><%=navuser.getAbout()%></td>
											</tr>
											<tr>
												<th scope="row">Registered:</th>
												<td><%=navuser.getDate()%></td>
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
													<td><%=navuser.getId()%></td>
												</tr>
												<tr>
													<th scope="row">Email:</th>
													<td><input type="email" class="form-control"
														name="user_email" value="<%=navuser.getEmail()%>"></td>
												</tr>
												<tr>
													<th scope="row">User Name:</th>
													<td><input type="text" class="form-control"
														name="user_name" value="<%=navuser.getUsername()%>"></td>
												</tr>
												<tr>
													<th scope="row">About:</th>
													<td><textarea class="form-control" name="user_about"><%=navuser.getAbout()%></textarea></td>
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
		<!-- Add Post Modal -->

		<div class="modal fade" id="post-modal" tabindex="-1"
			aria-labelledby="post-modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header primary-bg text-white">
						<h5 class="modal-title text-uppercase" id="exampleModalLabel">Add
							Post</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="add-post-form" action="AddPostServlet" method="POST"
							enctype="multipart/form-data">
							<div class="form-group">
								<select class="form-control" name="cid">
									<option selected disabled>Select Your Category</option>
									<%
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
									ArrayList<Categories> cats = postd.getAllCategories();
									if (cats != null) {
										for (Categories cat : cats) {
									%>
									<option value="<%=cat.getCid()%>"><%=cat.getName()%></option>
									<%
									}
									}
									%>
								</select>
							</div>
							<div class="mt-2 form-group">
								<input type="text" placeholder="Enter Post Title" name="pTitle"
									class="form-control" />
							</div>
							<div class="mt-2 form-group">
								<textarea class="form-control" style="height: 150px;"
									name="pContext" placeholder="Enter your context"></textarea>
							</div>
							<div class="mt-2 form-group">
								<textarea class="form-control" style="height: 150px;"
									name="pCode" placeholder="Enter your program"></textarea>
							</div>
							<div class="mt-2 form-group">
								<label>Select Your Pic...</label> <br> <input type="file"
									name="pPic" class="form-control">
							</div>
							<div class="mt-3 text-center">
								<button type="submit" class="btn btn-success">Post</button>
								<button type="button" class="btn btn-warning"
									data-bs-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	<!-- End Post Modal -->
		
      <%} %>
    </div>
  </div>
</nav>