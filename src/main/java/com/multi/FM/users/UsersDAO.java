package com.multi.FM.users;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		my.insert("users.create_account",usersvo);
		my.insert("users.create_seller",sellervo);
	}
	
	public void create_account_consumer(UsersVO usersvo) {
		my.insert("users.create_account",usersvo);
	}
	
	public void edit_password(UsersVO usersvo) {
	  my.update("users.edit_password",usersvo);
    }
	
	public String find_id(UsersVO usersvo) {
      String result = my.selectOne("users.find_id",usersvo);
      return result;
    }
	
	public int cus_login(UsersVO usersvo) {
      int result = my.selectOne("users.cus_login",usersvo);
      return result;
    }
	
	public int seller_login(UsersVO usersvo) {
      int result = my.selectOne("users.seller_login",usersvo);
      return result;
    }
	
	public int seller_black_list(String user_id) {
      int result = my.selectOne("users.black_list",user_id);
      return result;
    }
    
    public int seller_duplicate(String selling_number) {
      int result = my.selectOne("users.seller_duplicate",selling_number);
      return result;
    }
	
	public int phone_duplicate(String user_tel) {
		int result = my.selectOne("users.phone_duplicate", user_tel);
		return result;
	}
	public int email_duplicate(String user_id) {
		int result = my.selectOne("users.email_duplicate", user_id);
		return result;
	}
}
