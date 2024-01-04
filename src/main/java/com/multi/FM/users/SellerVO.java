package com.multi.FM.users;

public class SellerVO {
	private String user_id;
	private String selling_number;
	private String create_date;
	private int seller_black;
	
	public int getSeller_black() {
		return seller_black;
	}
	public void setSeller_black(int seller_black) {
		this.seller_black = seller_black;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSelling_number() {
		return selling_number;
	}
	public void setSelling_number(String selling_number) {
		this.selling_number = selling_number;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	@Override
	public String toString() {
		return "SellerVO [user_id=" + user_id + ", selling_number=" + selling_number + ", create_date=" + create_date
				+ "]";
	}
	 
}
