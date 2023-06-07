package com.tech.blog.entites;

import java.sql.*;

public class Post {

	private int pId;
	private String pTitle;
	private String pContext;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int userId;
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContext() {
		return pContext;
	}
	public void setpContext(String pContext) {
		this.pContext = pContext;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(String pTitle, String pContext, String pCode, String pPic, int catId, int userId) {
		super();
		this.pTitle = pTitle;
		this.pContext = pContext;
		this.pCode = pCode;
		this.pPic = pPic;
		this.catId = catId;
		this.userId = userId;
	}
	public Post(int pId, String pTitle, String pContext, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContext = pContext;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId = userId;
	}
}