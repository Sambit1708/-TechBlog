package com.tech.blog.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	private Connection conn;
	
	public LikeDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean insertLike(int pid, int uid) {
		
		boolean status = false;
		
		try {
			String query = "INSERT INTO likes (pid, uid) VALUES (?, ?);";
			PreparedStatement prep = this.conn.prepareStatement(query);
			prep.setInt(1, pid);
			prep.setInt(1, uid);
			
			prep.executeUpdate(query);
			status = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int countLikesOnPost(int pid) {
		int count = 0;
		
		try {
			String query = "SELECT COUNT(*) AS count_likes FROM likes WHERE pid=?;";
			PreparedStatement prep = this.conn.prepareStatement(query);
			prep.setInt(1, pid);
			
			ResultSet result = prep.executeQuery();
			if(result.next()) {
				count = result.getInt("count_likes");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
}
