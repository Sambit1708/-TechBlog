package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.doa.UserDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class EditSerlet
 */
public class EditSerlet extends HttpServlet {
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
    		
    		// Fetching email and password from request 
    		String email = request.getParameter("user_email");
    		String name = request.getParameter("user_name");
    		
    		HttpSession session  = request.getSession();
    		User user = (User)session.getAttribute("currentUser");
    		user.setEmail(email);
    		user.setUsername(name);
    		
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		
    		// Sending Previous Details with new One
    		boolean res = dao.editUser(user);
    		if(res) {
    			out.println("Updated");
    		}
    		else {
    			out.println("Error");
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