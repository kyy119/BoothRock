package com.multi.FM.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO usersdao;
	
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		usersdao.create_account_seller(usersvo,sellervo);
	}
	
	public void create_account_consumer(UsersVO usersvo) {
		usersdao.create_account_consumer(usersvo);
	}
	public int phone_duplicate(String user_tel) {
		int result = usersdao.phone_duplicate(user_tel);
		return result;
	}
	public int email_duplicate(String user_id) {
		int result = usersdao.email_duplicate(user_id);
		return result;
	}
	 
}
