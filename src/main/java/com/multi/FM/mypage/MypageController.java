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
import com.multi.FM.booth.BoothReviewVO;
import com.multi.FM.users.UsersVO;

@Controller
public class MypageController {

  @Autowired
  MypageDAO dao;

  @RequestMapping("mypage_edit_info") // 회원정보조회
  public void mypage_edit_info(UsersVO users, Model model) throws Exception {
    List<UsersVO> list = dao.user_info(users.getUser_id());
    if (users.getUser_role().equals("seller")) { //판매자이면 사업자 번호까지 조회
      String sellerNum = dao.user_seller_info(users.getUser_id());
      model.addAttribute("sellerNum", sellerNum);
    }
    model.addAttribute("list", list);
  }

  @PostMapping("mypage_edit") // 회원정보수정
  public String mypage_edit(@ModelAttribute UsersVO users, Model model) throws Exception {
    Date date = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
    users.setUser_updated_at(ft.format(date));
    if (users.getUser_role().equals("seller")) { //판매자이면 사업자 번호 수정
      dao.seller_edit(users);
    }
    int result = dao.user_edit(users);
    if (result == 1) { // 수정 필요 - 성공여부에 따라 다른 결과 전송하기
      model.addAttribute("alertMessage", "Success!");
  } else {
      model.addAttribute("alertMessage", "Error!");
  }
    return "redirect:/mypage.jsp";
  }


  @RequestMapping("mypage_jjimlist") // 찜 목록
  public void mypage_jjimlist() throws Exception {}

  @RequestMapping("mypage_review") // 리뷰 보기
  public void mypage_review(String user_id, Model model) throws Exception {
    List<BoothReviewVO> list = dao.review_list(user_id);
    model.addAttribute("list", list);
  }

  @RequestMapping("mypage_ask") // 문의 내역
  public void mypage_ask() throws Exception {

  }

  @RequestMapping("mypage_booth") // 부스 관리
  public void mypage_booth() throws Exception {

  }

}
