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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()) {
    		Thread.sleep(3000);
    		out.println("<!DOCTYPE html>");
    		out.println("<html>");
    		out.println("<head>");
    		out.println("<!DOCTYPE html>");
    		out.println("<title>My Home Page</title>");
    		out.println("</head>");
    		out.println("<body>");
    		
    		// Fetching useremail and password from request 
    		String userEmail = request.getParameter("user_email");
    		String userPassword = request.getParameter("user_password");
    		
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
    		
    		if(user != null) {
    			HttpSession session = request.getSession();
    			session.setAttribute("currentUser", user);
    			response.sendRedirect("profile.jsp");
    		} else {
    			Message msg = new Message("Invalid Details! try with another user", "error", "alert-danger");
    			HttpSession ESessin = request.getSession();
    			ESessin.setAttribute("msg", msg);
    			response.sendRedirect("login.jsp");
    		}
    		
    		out.println("</body>");
    		out.println("</html>");
    	} catch(Exception ex) {
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
