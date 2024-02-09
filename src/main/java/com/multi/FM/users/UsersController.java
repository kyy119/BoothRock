package com.multi.FM.users;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
@RequestMapping("users")
public class UsersController {
	
	@Autowired
	UsersService users_service;
	
	@Autowired
	UsersDAO usersdao;
	
	private final String business_url_key;
	
	@Autowired
	public UsersController(
	    @Value("${business.urlKey}") String business_url_key) {
	    this.business_url_key = business_url_key;
	}
	
	SecureRandom r = new SecureRandom();
	String num = "";
	
	@RequestMapping("create_account_seller")
	public void create_account_seller(UsersVO usersvo,SellerVO sellervo) {
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(usersvo.getUser_password());
		usersvo.setUser_password(encodedPassword);
		usersvo.setUser_role("seller");
		usersvo.setUser_created_at(ft.format(date));
		usersvo.setUser_updated_at(ft.format(date));
		usersvo.setUser_black(0);
		sellervo.setUser_id(usersvo.getUser_id());
		sellervo.setCreate_date(usersvo.getUser_created_at());
		sellervo.setSeller_black(0);
		users_service.create_account_seller(usersvo,sellervo);
	}
	
	@RequestMapping("create_account_consumer")
	public void create_account_consumer(UsersVO usersvo) {
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(usersvo.getUser_password());
        usersvo.setUser_password(encodedPassword);
		usersvo.setUser_role("consumer");
		usersvo.setUser_created_at(ft.format(date));
		usersvo.setUser_updated_at(ft.format(date));
		usersvo.setUser_black(0);
		users_service.create_account_consumer(usersvo);
	}
	
	@RequestMapping("find_id")
    public void find_id(UsersVO usersvo,Model model) {
	  String result = users_service.find_id(usersvo);
	  String notify = "";
	  String find_id_result = "0";
	  if(result != null && !result.equals("")) {
	    notify = "��ġ�ϴ� ������ �����մϴ�!";
	    find_id_result = result;
	  }else {
	    notify = "��ġ�ϴ� ������ �����ϴ�!";
	  }
	  model.addAttribute("find_id_notify", notify);
	  model.addAttribute("find_id_result", find_id_result);
    }
	
	@RequestMapping("edit_password")
	public void edit_password(UsersVO usersvo) {
	  PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
      String encodedPassword = passwordEncoder.encode(usersvo.getUser_password());
      usersvo.setUser_password(encodedPassword);
	  users_service.edit_password(usersvo);
    }
	
	@RequestMapping("login")
	public void login(String referer,UsersVO usersvo,Model model,HttpSession session) throws Exception{
	  PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	  String answer = usersdao.authenticateUser(usersvo.getUser_id());
	  boolean correct = passwordEncoder.matches(usersvo.getUser_password(), answer);
	  System.out.println("�α��� ���� ���� : " + correct);
	  int result_cus = users_service.cus_login(usersvo);
	  int result_seller = users_service.seller_login(usersvo);
	  int result_admin = users_service.admin_login(usersvo);
	  String consumer = String.valueOf(result_cus);
	  String seller = String.valueOf(result_seller);
	  String admin = String.valueOf(result_admin);
	  String result = "0";
	  if (consumer.equals("1") && correct == true) {
	     String consumer_black_list = String.valueOf(users_service.consumer_black_list(usersvo.getUser_id()));
         if(consumer_black_list.equals("1")) {
           session.setAttribute("id", usersvo.getUser_id());
           session.setAttribute("role", "consumer");
           result = "1";
         }else {
           result = "2";
         }
      }else if(seller.equals("1") && correct == true) {
        String seller_black_list = String.valueOf(users_service.seller_black_list(usersvo.getUser_id()));
        if(seller_black_list.equals("1")) {
          session.setAttribute("id", usersvo.getUser_id());
          session.setAttribute("role", "seller");
          result = "1";
        }else {
          result = "2";
        }
      }else if(admin.equals("1")) {
        session.setAttribute("id", usersvo.getUser_id());
        session.setAttribute("role", "admin");
        result = "3";
      }
	  model.addAttribute("result",result);
	  model.addAttribute("referer", referer);
    }
	
	
	@RequestMapping("create_authentication")
	@ResponseBody
	public String create_authentication1(String receive) {
		num = String.valueOf(100000 + r.nextInt(900000));// >> ���񽺷� ��������
		users_service.message_send(receive,num);
		return num;
	}
	
	@RequestMapping("seller_duplicate")
    @ResponseBody
    public String seller_duplicate(String selling_number) {
        int result = users_service.seller_duplicate(selling_number);
        String result2 = String.valueOf(result);
        return result2;
    }
	
	@RequestMapping("phone_duplicate")
	@ResponseBody
	public String phone_duplicate(String user_tel) {
		int result = users_service.phone_duplicate(user_tel);
		String result2 = String.valueOf(result);
		return result2;
	}
	@RequestMapping("email_duplicate")
	@ResponseBody
	public String email_duplicate(String user_id) {
		int result = users_service.email_duplicate(user_id);
		String result2 = String.valueOf(result);
		return result2;
	}
	@RequestMapping("businessAPI")
    @ResponseBody
    public String businessAPI(String user_id) {
	    String result = business_url_key;
        return result;
    }
}
