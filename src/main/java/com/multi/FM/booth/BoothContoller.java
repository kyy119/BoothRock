package com.multi.FM.booth;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.multi.FM.myboothpage.BoothVO;



@Controller
@RequestMapping("booth")
public class BoothContoller {

  @Autowired
  BoothDAO dao;
  
  @Autowired
  BoothService boothSV;

  // booth 상세 페이지_booth정보
  @RequestMapping("booth_detail")
  public void detail(BoothVO boothVO, Model model) {
    BoothVO boothDetail = boothSV.detail(boothVO);
    model.addAttribute("boothDetail", boothDetail);
  }//booth_detail
  

  // booth 상세 페이지_booth_product정보
  @RequestMapping("/booth_product")
  public String product(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothProductVO> boothProduct = boothSV.product(booth_no);
      model.addAttribute("boothProduct", boothProduct);
      return "booth/booth_product";
 
  }// product
}// class
