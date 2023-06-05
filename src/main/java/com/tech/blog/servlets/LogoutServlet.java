package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.entites.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LogoutServlet extends HttpServlet {
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
    		
    		try {
    			
    			HttpSession session = request.getSession();
    			session.removeAttribute("currentUser");
    			
    			Message msg = new Message("Logout Successgully!", "success", "alert-success");
    			session.setAttribute("msg", msg);
    			
    			response.sendRedirect("login.jsp");
    			
    		} catch(Exception e) {
    			e.printStackTrace();
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
