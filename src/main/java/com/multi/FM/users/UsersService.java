package com.multi.FM.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO users_dao;
	
	@Autowired
    SmsSend sms;
	
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		users_dao.create_account_seller(usersvo,sellervo);
	}
	
	public void create_account_consumer(UsersVO usersvo) {
		users_dao.create_account_consumer(usersvo);
	}
	
	public String find_id(UsersVO usersvo) {
	    String result = users_dao.find_id(usersvo);
        return result;
    }
	
	public void edit_password(UsersVO usersvo) {
	    users_dao.edit_password(usersvo);
    }
	
	public void message_send(String receive,String num) {
	   sms.send_one(receive, num);
    }
	
	public int cus_login(UsersVO usersvo) {
	  int result = users_dao.cus_login(usersvo);
	  return result;
	}
	
	public int seller_login(UsersVO usersvo) {
      int result = users_dao.seller_login(usersvo);
      return result;
    }
	
	public int admin_login(UsersVO usersvo) {
	  int result = users_dao.admin_login(usersvo);
	  return result;
	}
	
	public int seller_black_list(String user_id) {
      int result = users_dao.seller_black_list(user_id);
      return result;
    }
    
    public int seller_duplicate(String selling_number) {
      int result = users_dao.seller_duplicate(selling_number);
      return result;
    }
	
	public int phone_duplicate(String user_tel) {
		int result = users_dao.phone_duplicate(user_tel);
		return result;
	}
	public int email_duplicate(String user_id) {
		int result = users_dao.email_duplicate(user_id);
		return result;
	}
	
}
