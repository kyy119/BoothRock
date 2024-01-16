package com.multi.FM.myboothpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.multi.FM.fstv.FestivalVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.*;

@Controller
//@RequestMapping("/Mybooth")
public class MyBoothController {

  @Autowired
  private MyboothService MyboothService;
  
  @PostMapping("/add")
  public String addBooth(BoothVO boothVO) {
    MyboothService.addBooth(boothVO);
    return "redirect:/mypage_booth.jsp"; // Redirect to the booth management page
  }
//  @GetMapping("/festivals")
//  public String showFestivalForm(Model model) {
//    System.out.println("Festivals: test");
//    List<FestivalVO> festivals = MyboothService.ShowAllfstv();
//    model.addAttribute("festivals", festivals);
//    System.out.println("Festivals: " + festivals);
//    return "mypage_booth_add";
//  }
//  @GetMapping("/getFestivals")
//  @ResponseBody
//  public List<FestivalVO> getFestivals() {
//    System.out.println("getFestivals test");
//      return MyboothService.ShowAllfstv();
//  }
  @GetMapping("/mypage_booth_add")
  public void getFestivals(Model model) {
    System.out.println("getFestivals test");
      List<FestivalVO> festivals = MyboothService.ShowAllfstv();
      model.addAttribute("festivals", festivals);
  }
}