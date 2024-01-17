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
  public String addBooth(@RequestBody BoothVO boothVO) {
      try {
          MyboothService.addBooth(boothVO);
          // 리다이렉트 경로를 mypage_booth.jsp로 지정
          return "redirect:/mypage_booth.jsp";
      } catch (Exception e) {
          e.printStackTrace();
          // 에러가 발생한 경우, 에러 메시지를 콘솔에 출력하고 다시 폼 페이지로 이동
          return "redirect:/mypage_booth.jsp";
      }
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
    System.out.println("getFestivals test : " + festivals);
  }
}