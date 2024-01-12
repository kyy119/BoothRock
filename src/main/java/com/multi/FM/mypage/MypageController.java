package com.multi.FM.mypage;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.multi.FM.booth.BoothReviewVO;
import com.multi.FM.users.UsersVO;

@Controller
public class MypageController {
  
  @Autowired
  MypageDAO dao;
    
    @RequestMapping("mypage_edit_info") //회원정보조회
    public void mypage_edit_info(String user_id, Model model) throws Exception {
        List<UsersVO> list = dao.user_info(user_id);
        model.addAttribute("list",list);
    }
    
    @RequestMapping("mypage_edit") //회원정보수정
    public String mypage_edit() throws Exception {
        return "redirect:/mypage.jsp";
    }
    
    
    @RequestMapping("mypage_jjimlist") //찜 목록
    public void mypage_jjimlist() throws Exception{
    
    }
    
    @RequestMapping("mypage_review") //리뷰 보기
    public void mypage_review(String user_id, Model model) throws Exception {
      List<BoothReviewVO> list = dao.review_list(user_id);
      model.addAttribute("list", list);
  }
    
    @RequestMapping("mypage_ask") //문의 내역
    public void mypage_ask() throws Exception{
        
    }
    
    @RequestMapping("mypage_booth") //부스 관리
    public void mypage_booth() throws Exception{
    
    }
    
}
