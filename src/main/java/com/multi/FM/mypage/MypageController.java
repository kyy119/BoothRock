package com.multi.FM.mypage;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.multi.FM.booth.BoothReviewVO;

@Controller
public class MypageController {
  
  @Autowired
  MypageDAO dao;
    
    @RequestMapping("mypage_edit")
    public void mypage_edit() throws Exception {
        
    }
    
    @RequestMapping("mypage_jjimlist")
    public void mypage_jjimlist() throws Exception{
    
    }
    
    @RequestMapping("mypage_review")
    public void mypage_review(String user_id, Model model) {
      List<BoothReviewVO> list = dao.review_list(user_id);
      System.out.println(list.size());
      System.out.println(user_id);
      model.addAttribute("list", list);
  }
    
    @RequestMapping("mypage_ask")
    public void mypage_ask() throws Exception{
        
    }
    
    @RequestMapping("mypage_booth")
    public void mypage_booth() throws Exception{
    
    }
    
}
