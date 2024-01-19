package com.multi.FM.users;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
public class UsersController {
	
	@Autowired
	UsersService usersservice;
	
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
	
	@RequestMapping("find_id")
    public void find_id(UsersVO usersvo,Model model) {
	  String result = usersservice.find_id(usersvo);
	  String notify = "";
	  String find_id_result = "0";
	  if(result != null && !result.equals("")) {
	    notify = "일치하는 정보가 존재합니다!";
	    find_id_result = result;
	  }else {
	    notify = "일치하는 정보가 없습니다!";
	  }
	  model.addAttribute("find_id_notify", notify);
	  model.addAttribute("find_id_result", find_id_result);
    }
	
	@RequestMapping("edit_password")
	public void edit_password(UsersVO usersvo) {
	  usersservice.edit_password(usersvo);
    }
	
	@RequestMapping("login")
	public void login(UsersVO usersvo,Model model,HttpSession session) throws Exception{
	  int resultCus = usersservice.cus_login(usersvo);
	  int resultSeller = usersservice.seller_login(usersvo);
	  String consumer = String.valueOf(resultCus);
	  String seller = String.valueOf(resultSeller);
	  String result = "0";
	  if (consumer.equals("1")) {
         session.setAttribute("id", usersvo.getUser_id());
         session.setAttribute("role", "consumer");
         result = "1";
      }else if(seller.equals("1")) {
        String seller_black_list = String.valueOf(usersservice.seller_black_list(usersvo.getUser_id()));
        if(seller_black_list.equals("1")) {
          session.setAttribute("id", usersvo.getUser_id());
          session.setAttribute("role", "seller");
          result = "1";
        }else {
          result = "2";
        }
      }
	  model.addAttribute("result",result);
    }
	
	
	@RequestMapping("create_authentication")
	@ResponseBody
	public String create_authentication1(String receive) {
		num = String.valueOf(100000 + r.nextInt(900000));// >> 서비스로 빠져야함
		//usersservice.message_send(receive,num);
		return num;
	}
	
	@RequestMapping("seller_duplicate")
    @ResponseBody
    public String seller_duplicate(String selling_number) {
        int result = usersservice.seller_duplicate(selling_number);
        String result2 = String.valueOf(result);
        return result2;
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
