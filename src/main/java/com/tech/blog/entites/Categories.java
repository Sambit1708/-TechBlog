package com.tech.blog.entites;

public class Categories {

	private int cid;
	private String name;
	private String desription;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesription() {
		return desription;
	}
	public void setDesription(String desription) {
		this.desription = desription;
	}
	public Categories(String name, String desription) {
		super();
		this.name = name;
		this.desription = desription;
	}	
	public Categories(int cid, String name, String desription) {
		super();
		this.cid = cid;
		this.name = name;
		this.desription = desription;
	}
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}
}
