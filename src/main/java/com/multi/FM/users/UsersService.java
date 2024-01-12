package com.multi.FM.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO usersdao;
	
	@Autowired
    SmsSend sms;
	
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		usersdao.create_account_seller(usersvo,sellervo);
	}
	
	public void create_account_consumer(UsersVO usersvo) {
		usersdao.create_account_consumer(usersvo);
	}
	
	public String find_id(UsersVO usersvo) {
	    String result = usersdao.find_id(usersvo);
        return result;
    }
	
	public void edit_password(UsersVO usersvo) {
	    usersdao.edit_password(usersvo);
    }
	
	public void message_send(String receive,String num) {
	   sms.sendOne(receive, num);
    }
	
	public int cus_login(UsersVO usersvo) {
	  int result = usersdao.cus_login(usersvo);
	  return result;
	}
	
	public int seller_login(UsersVO usersvo) {
      int result = usersdao.seller_login(usersvo);
      return result;
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
