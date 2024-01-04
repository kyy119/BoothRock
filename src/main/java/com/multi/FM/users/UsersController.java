package com.multi.FM.users;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsersController {
	
	@Autowired
	UsersService usersservice;
	
	@Autowired
	SmsSend sms;
	
	SecureRandom r = new SecureRandom();
	String num = "";
	
	@RequestMapping("create_account_seller")
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
		usersvo.setUser_role("seller");
		usersvo.setUser_created_at(ft.format(date));
		usersvo.setUser_updated_at(ft.format(date));
		sellervo.setUser_id(usersvo.getUser_id());
		sellervo.setCreate_date(usersvo.getUser_created_at());
		usersservice.create_account_seller(usersvo,sellervo);
	}
	
	@RequestMapping("create_account_consumer")
	public void create_account_consumer(UsersVO usersvo) {
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
		usersvo.setUser_role("consumer");
		usersvo.setUser_created_at(ft.format(date));
		usersvo.setUser_updated_at(ft.format(date));
		usersservice.create_account_consumer(usersvo);
	}
	
	@RequestMapping("create_authentication1")
	@ResponseBody
	public String create_authentication1(String receive) {
		num = String.valueOf(100000 + r.nextInt(900000));// >> 서비스로 빠져야함
//		sms.sendOne(receive, num); // >> 서비스로 빠져야함
		return num;
	}
	
	@RequestMapping("phone_duplicate")
	@ResponseBody
	public String phone_duplicate(String user_tel) {
		int result = usersservice.phone_duplicate(user_tel);
		String result2 = String.valueOf(result);
		return result2;
	}
	@RequestMapping("email_duplicate")
	@ResponseBody
	public String email_duplicate(String user_id) {
		int result = usersservice.email_duplicate(user_id);
		String result2 = String.valueOf(result);
		return result2;
	}
}
