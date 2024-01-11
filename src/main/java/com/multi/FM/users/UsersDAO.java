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
	
	public int login(UsersVO usersvo) {
      int result = my.selectOne("users.login",usersvo);
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
