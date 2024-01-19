package com.multi.FM.users;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UsersVO {
	private String user_id;
	private String user_password;
	private String user_role;
	private String user_created_at;
	private String user_updated_at;
	private String user_name;
	private String user_tel;
	private String selling_number;
	private int seller_black;
	private int user_black;
	private int fstv_no;
	private int booth_count;
	private int booth_ban_count;
	private int review_count;
	private int ask_count;
	private int report_count;
	private int report_ban_count;
	
}
