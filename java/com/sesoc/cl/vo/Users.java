package com.sesoc.cl.vo;

public class Users {
	private String id;
	private String password;
	private String email;
	private String is_deleted;
	private String name;
	private String img_name;
	public Users() {
		
	}
	public Users(String id, String password, String email, String is_deleted, String name, String img_name) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.is_deleted = is_deleted;
		this.name = name;
		this.img_name = img_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", password=" + password + ", email=" + email + ", is_deleted=" + is_deleted
				+ ", name=" + name + ", img_name=" + img_name + "]";
	}
	

}
