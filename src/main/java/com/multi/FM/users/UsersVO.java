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
	private int fstv_no;
}
