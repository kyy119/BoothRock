package com.multi.FM.booth;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.multi.FM.myboothpage.BoothVO;



@Controller
public class BoothReviewContoller {

  @Autowired
  BoothDAO dao;
  
  @Autowired
  BoothReviewService boothRSV;
  
  @Autowired
  BoothService boothSV;

  
//booth 상세 페이지_booth정보
 @RequestMapping("Rbooth")
 public String Rbooth(@RequestParam("booth_no") int booth_no, Model model) {
   BoothVO Rbooth = boothRSV.Rbooth(booth_no);
   model.addAttribute("Rbooth", Rbooth);
   System.out.println("Rbooth 호출");
   return "booth_review"; 
 }//booth_detail
  
  // review 리스트(더보기)
  @RequestMapping("booth_review")
  public String review(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothReviewVO> boothReview = boothRSV.list(booth_no);
      model.addAttribute("boothReview", boothReview);
       System.out.println("booth_review 호출");
      return "booth_review"; 
  }// review list
 
  
}// class
