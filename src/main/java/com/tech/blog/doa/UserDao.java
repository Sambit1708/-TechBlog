package com.tech.blog.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entites.User;

public class UserDao {

	private Connection conn;

	public Connection getConnection() {
		return conn;
	}

	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			
			String query = "INSERT INTO `user` (`username`, `email`, `password`) VALUES (?, ?, ?);";
			
			PreparedStatement prpt = conn.prepareStatement(query);
			prpt.setString(1, user.getUsername());
			prpt.setString(2, user.getEmail());
			prpt.setString(3, user.getPassword());
			
			prpt.executeUpdate();
			f = true;
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return f;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		
		User user = null;
			
		try {
			
			String query = "SELECT * FROM `user` WHERE `email`=? AND `password`=?;";
			PreparedStatement prep = conn.prepareStatement(query);
			prep.setString(1, email);
			prep.setString(2, password);
			
			ResultSet result = prep.executeQuery();
			if(result.next()) {
				user = new User();
				
				int user_id = result.getInt("id");
				user.setId(user_id);
				
				String username = result.getString("username");
				user.setUsername(username);
				
				String user_email = result.getString("email");
				user.setEmail(user_email);
				
				String user_password = result.getString("password");
				user.setPassword(user_password);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean editUser(User user) {
		
		boolean res=false;
		
		try {
			
			String query = "UPDATE USER SET email=?, username=? WHERE id=?;";
			PreparedStatement prep = conn.prepareStatement(query);
			prep.setString(1, user.getEmail());
			prep.setString(2, user.getUsername());
			prep.setInt(3, user.getId());
			
			prep.executeUpdate();
			res = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
}
