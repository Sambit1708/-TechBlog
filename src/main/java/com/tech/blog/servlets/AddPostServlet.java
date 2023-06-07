package com.tech.blog.servlets;

import java.io.*;

import com.tech.blog.doa.PostDao;
import com.tech.blog.entites.Post;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			Thread.sleep(3000);
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<!DOCTYPE html>");
			out.println("<title>My Home Page</title>");
			out.println("</head>");
			out.println("<body>");

			// Getting all the details
			int cId = Integer.parseInt(request.getParameter("cid"));
			String pTitle = request.getParameter("pTitle");
			String pContext = request.getParameter("pContext");
			String pCode = request.getParameter("pCode");
			Part part = request.getPart("pPic");

			PostDao dao = new PostDao(ConnectionProvider.getConnection());
			// Getting User Id
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			Post pst = new Post(pTitle, pContext, pCode, part.getSubmittedFileName(), cId, user.getId());

			String imgPath = part.getSubmittedFileName();

			if (Helper.saveFile(part.getInputStream(), imgPath)) {
				boolean saveResult = dao.savePost(pst);
				if (saveResult) {
					out.println("done");
				} else {
					out.println("error");
				}
			}

			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
