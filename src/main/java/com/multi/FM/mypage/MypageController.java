package com.multi.FM.mypage;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.multi.FM.fstv.FestivalVO;
import com.multi.FM.fstv.JjimVO;
import com.multi.FM.manager.AskVO;
import com.multi.FM.review.BoothReviewVO;
import com.multi.FM.users.UsersVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
@RequestMapping("mypage")
public class MypageController {

  @Autowired
  MypageDAO dao;

  @RequestMapping("mypage_edit_info") // �쉶�썝�젙蹂댁“�쉶
  public void mypage_edit_info(UsersVO users, Model model) throws Exception {
    List<UsersVO> list = dao.user_info(users.getUser_id());
    if (users.getUser_role().equals("seller")) { // �뙋留ㅼ옄�씠硫� �궗�뾽�옄 踰덊샇源뚯� 議고쉶
      String seller_num = dao.user_seller_info(users.getUser_id());
      model.addAttribute("seller_num", seller_num);
    }
    model.addAttribute("list", list);
  }

  @PostMapping("mypage_edit") // �쉶�썝�젙蹂댁닔�젙
  public String mypage_edit(@ModelAttribute UsersVO users, Model model) throws Exception {
    Date date = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
    users.setUser_updated_at(ft.format(date));
    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    String encodedPassword = passwordEncoder.encode(users.getUser_password());
    users.setUser_password(encodedPassword);
    if (users.getUser_role().equals("seller")) { // �뙋留ㅼ옄�씠硫� �궗�뾽�옄 踰덊샇 �닔�젙
      int seller_result = dao.seller_edit(users);
      if (seller_result == 1) {
        System.out.println("�궗�뾽�옄 踰덊샇 �닔�젙 �셿猷�");
      } else {
        System.out.println("�궗�뾽�옄 踰덊샇 �닔�젙 �떎�뙣");
      }
    }
    int result = dao.user_edit(users);
    if (result == 1) {
      model.addAttribute("alert_message", "Success!");
    } else {
      model.addAttribute("alert_message", "Error!");
    }
    return "redirect:../mypage.jsp";
  }


  @RequestMapping("mypage_jjimlist") // 李� 紐⑸줉
  public void mypage_jjimlist(String user_id, Model model) throws Exception {
    List<FestivalVO> list = dao.jjim_list(user_id);
    model.addAttribute("list", list);
  }

  @RequestMapping("mypage_review") // 由щ럭 蹂닿린
  public void mypage_review(String user_id, Model model) throws Exception {
    List<BoothReviewVO> list = dao.review_list(user_id);
    model.addAttribute("list", list);
  }

  @RequestMapping("mypage_jjim_delete") // 李� �궘�젣
  @ResponseBody
  public String delete(JjimVO users) {
    int result = dao.jjim_delete(users);
    if (result == 1) {
      return "";
    } else {
      return "fail";
    }
  }

  @RequestMapping("mypage_ask") // 臾몄쓽 �궡�뿭
  public void mypage_ask(String user_id, Model model) throws Exception {
    List<AskVO> list = dao.mypage_ask(user_id);
    model.addAttribute("list", list);
  }
}
