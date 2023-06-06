package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection conn;
	private static String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	private static String urlDB = "jdbc:mysql://localhost:3306/techblog?enabledTLSProtocols=TLSv1.2";
	private static String usernameDB = "root";
	private static String passwordDB = "root";
	
	public static Connection getConnection() {
		
		try {
			if(conn == null) {
				Class.forName(jdbcDriver);
				conn = DriverManager.getConnection(urlDB, usernameDB, passwordDB);
			}
					
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	
	
}
