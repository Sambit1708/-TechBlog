package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.doa.UserDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EditSerlet
 */
public class EditSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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

			// Fetching email and password from request
			String email = request.getParameter("user_email");
			String name = request.getParameter("user_name");
			String about = request.getParameter("user_about");

			HttpSession session = request.getSession();
			User userEdit = (User) session.getAttribute("currentUser");
			if(!userEdit.getEmail().contains(email) && email!=null) {
				userEdit.setEmail(email);
			}
			if(!userEdit.getUsername().contains(name) && name!=null) {
				userEdit.setUsername(name);
			}
			if(!userEdit.getAbout().contains(about) && about!=null) {
				userEdit.setAbout(about);
			}

			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			boolean res = dao.editUser(userEdit);
			if (res) {
				out.println("Updated");
				Message msg = new Message("Profile Details Updated!", "success", "alert-success");
				session.setAttribute("msg", msg);
			} else {
				out.println("Error");
				Message msg = new Message("Some thing went wrong!", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");

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