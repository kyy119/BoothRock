package com.multi.FM.booth;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BoothReviewContoller {

  @Autowired
  BoothDAO dao;
  
  @Autowired
  BoothReviewService boothRSV;
  
  @Autowired
  BoothService boothSV;

  
  // review 리스트(더보기)
  @RequestMapping("booth_review")
  public String review(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothReviewVO> boothReview = boothRSV.list(booth_no);
      model.addAttribute("boothReview", boothReview);
      return "booth_review"; 
  }// review list
  
  //review의 부스정보 불러오기
  @RequestMapping("booth_detail_review")
  public String detail_review(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothReviewVO> boothDetailReview = boothRSV.list(booth_no);
      model.addAttribute("boothDetailReview", boothDetailReview);
      return "booth_detail_review"; 
  }// booth_detail_review list
 
  
}// class
