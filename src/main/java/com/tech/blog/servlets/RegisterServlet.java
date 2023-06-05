package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.doa.UserDao;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
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
    		
    		// Getting all the details
    		
    		String check = request.getParameter("check");
    		
    		if(check == null) {
    			out.println("Please accept our terms & condition.");
    		} else {
    			String useremail = request.getParameter("user_email");
        		String userpassword = request.getParameter("user_password");
        		String username = request.getParameter("user_name");
        		//Create user object to set data
        		User user = new User(username, useremail, userpassword);
        			
        		// Creating object for user doa
        		UserDao dao = new UserDao(ConnectionProvider.getConnection());
        		boolean saveUserStatus = dao.saveUser(user);
        		if(saveUserStatus) {
        			out.println("done");
        		} else {
        			out.println("error");
        		}
    		}
    		out.println("</body>");
    		out.println("</html>");
    	} catch(Exception ex) {
    		ex.printStackTrace();
    	}
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
