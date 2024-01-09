package com.multi.FM.booth;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.FM.myboothpage.BoothVO;



@Controller
public class BoothContoller {

//  @Autowired
//  BoothDAO dao;
//
//  // booth 상세 페이지_booth정보
//  @RequestMapping("/detail")
//  public String detail(Model model) throws Exception {
//    List<BoothVO> detail = dao.detail();
//    model.addAttribute("booth_detail", detail);
//    return "booth_detail";
//  }// detail
//
//  // booth 상세 페이지_booth_product정보
//  @RequestMapping("/product")
//  public String product(Model model) throws Exception {
//    List<BoothProductVO> product = dao.product();
//    model.addAttribute("booth_product", product);
//    return "booth_detail";
//  }// product
//
//  // booth 상세 페이지_중복신고체크
//  // 1 ID당 각 부스 신고를 한 번만 할 수 있도록 제한
//  @RequestMapping("/duplicateReportCheck")
//  public String report(Model model, HttpSession session) {
//    String userId = (String) session.getAttribute("userId");
//    model.addAttribute("userId", userId);
//    return "booth_detail";
//  }// duplicateReportCheck



}// class
