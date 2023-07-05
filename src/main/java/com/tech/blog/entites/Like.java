package com.tech.blog.entites;

public class Like {

	private int id;
	private int pid;
	private int uid;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public Like(int id, int pid, int uid) {
		this.id = id;
		this.pid = pid;
		this.uid = uid;
	}
	public Like(int pid, int uid) {
		this.pid = pid;
		this.uid = uid;
	}
	public Like() {
		super();
	}
	
}
