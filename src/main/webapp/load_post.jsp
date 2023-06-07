<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.entites.Message"%>
<%@page import="com.tech.blog.entites.User"%>
<%@page import="com.tech.blog.entites.Post"%>
<%@page import="com.tech.blog.entites.Categories"%>
<%@page import="com.tech.blog.doa.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.Helper"%>
<div class="row">
<%
	int cid = Integer.parseInt(request.getParameter("cid"));

	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Post> loadPosts = null;
	if(cid == 0) {
		loadPosts = postDao.getAllPosts();
	}
	else {
		loadPosts = postDao.getAllPostsById(cid);
	}
	if(loadPosts.size() == 0) {
		out.println("<h4>No Post in this Category..</h4>");
		return;
	}
	for(Post pst : loadPosts) {
%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img src="pics/<%= pst.getpPic() %>" class="card-img-top" alt="<%=pst.getpPic()%>" style="height: 20rem; width: 100%;">
			<div class="card-body">
				<b><%= pst.getpTitle() %></b>
				<p><%= pst.getpContext() %></p>
			</div>
			<div class="card-footer text-center">
				<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i>&nbsp;<span>10</span></a>
				<a href="show_blog_page.jsp?post_id=<%=pst.getpId() %>" class="btn btn-outline-primary btn-sm">Read More...</a>
				<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i>&nbsp;<span>20</span></a>
			</div>
		</div>
	</div>

<%
	}
%>
</div>