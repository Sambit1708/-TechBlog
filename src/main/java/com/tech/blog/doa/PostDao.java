package com.tech.blog.doa;

import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.entites.Categories;
import com.tech.blog.entites.Post;

public class PostDao {

	private Connection conn;

	public Connection getConnection() {
		return conn;
	}

	public PostDao(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> cats = new ArrayList<Categories>();
		
		try {
			
			String query = "select * from categories";
			Statement stmt = this.conn.createStatement();
			ResultSet result = stmt.executeQuery(query);
			
			while(result.next()) {
				
				int cid = result.getInt(1);
				String name = result.getString(2);
				String desc = result.getString(3);
				
				Categories cat = new Categories(cid, name, desc);
				cats.add(cat);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return cats;
	}
	
	public boolean savePost(Post post) {
		boolean f = false;
		try {
			
			String query = "INSERT INTO posts (pTitle, pContext, pCode, pPic, catId, userId) VALUES (?,?,?,?,?,?);";
			
			PreparedStatement prpt = conn.prepareStatement(query);
			prpt.setString(1, post.getpTitle());
			prpt.setString(2, post.getpContext());
			prpt.setString(3, post.getpCode());
			prpt.setString(4, post.getpPic());
			prpt.setInt(5, post.getCatId());
			prpt.setInt(6, post.getUserId());
			
			prpt.executeUpdate();
			f = true;
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return f;
	}
	
	public ArrayList<Post> getAllPosts() {
		
		ArrayList<Post> posts = new ArrayList<Post>();
		
		try {
			
			String query = "select * from posts";
			Statement stmt = this.conn.createStatement();
			ResultSet result = stmt.executeQuery(query);
			
			while(result.next()) {
				
				int pId = result.getInt("pid");
				String pTitle = result.getString("pTitle");
				String pContext = result.getString("pContext");
				String pCode = result.getString("pCode");
				String pPic = result.getString("pPic");
				Timestamp pDate = result.getTimestamp("pDate");
				int catId = result.getInt("catId");
				int userId = result.getInt("userId");
				
				Post post = new Post(pId, pTitle, pContext, pCode, pPic, pDate, catId, userId);
				posts.add(post);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return posts;
	}
	
	public ArrayList<Post> getAllPostsById(int cId) {
		
		ArrayList<Post> posts = new ArrayList<Post>();
		
		try {
			
			String query = "select * from posts where catId=?";
			PreparedStatement stmt = this.conn.prepareStatement(query);
			stmt.setInt(1, cId);
			ResultSet result = stmt.executeQuery();
			
			while(result.next()) {
				
				int pId = result.getInt("pid");
				String pTitle = result.getString("pTitle");
				String pContext = result.getString("pContext");
				String pCode = result.getString("pCode");
				String pPic = result.getString("pPic");
				Timestamp pDate = result.getTimestamp("pDate");
				int catId = result.getInt("catId");
				int userId = result.getInt("userId");
				
				Post post = new Post(pId, pTitle, pContext, pCode, pPic, pDate, catId, userId);
				posts.add(post);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return posts;
	}
	
	public Post getPostDetailById(int pid) {
		
		Post post = new Post();
		try {
			String query = "SELECT * FROM posts WHERE pid=?;";
			PreparedStatement prep = this.conn.prepareStatement(query);
			prep.setInt(1, pid);
			ResultSet result = prep.executeQuery();
			
			if(result.next()) {
				post.setpId(pid);
				post.setpTitle(result.getString("pTitle"));
				post.setpContext(result.getString("pContext"));
				post.setpCode(result.getString("pCode"));
				post.setpPic(result.getString("pPic"));
				post.setpDate(result.getTimestamp("pDate"));
				post.setCatId(result.getInt("catId"));
				post.setUserId(result.getInt("userId"));
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return post;
		
	}
}
