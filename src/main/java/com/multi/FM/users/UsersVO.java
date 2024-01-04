package com.multi.FM.users;

public class UsersVO {
	private String user_id;
	private String user_password;
	private String user_role;
	private String user_created_at;
	private String user_updated_at;
	private String user_name;
	private String user_tel;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public String getUser_created_at() {
		return user_created_at;
	}
	public void setUser_created_at(String user_created_at) {
		this.user_created_at = user_created_at;
	}
	public String getUser_updated_at() {
		return user_updated_at;
	}
	public void setUser_updated_at(String user_updated_at) {
		this.user_updated_at = user_updated_at;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	@Override
	public String toString() {
		return "UsersVO [user_id=" + user_id + ", user_password=" + user_password + ", user_role=" + user_role
				+ ", user_created_at=" + user_created_at + ", user_updated_at=" + user_updated_at + ", user_name="
				+ user_name + ", user_tel=" + user_tel + "]";
	}
			
}
