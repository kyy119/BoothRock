package com.multi.FM.myboothpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.multi.FM.booth.BoothProductVO;
import com.multi.FM.fstv.FestivalVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.*;

@Controller
//@RequestMapping("/Mybooth")
public class MyBoothController {

  @Autowired
  private MyboothService myboothService;
//  @PostMapping("/add")
//  public String addBoothProduct(BoothProductVO boothProductVO) {
//    try {
//      myboothService.addBoothProduct(boothProductVO);
//      // 성공적으로 상품을 추가한 경우 메시지를 반환하거나 다른 적절한 처리를 추가할 수 있습니다.
//      return "Booth product added successfully.";
//    } catch (Exception e) {
//      e.printStackTrace();
//      // 에러가 발생한 경우, 에러 메시지를 반환하거나 다른 적절한 처리를 추가할 수 있습니다.
//      return "Error adding booth product.";
//    }
//  }

  @RequestMapping(value = "/add", method = RequestMethod.POST)
  public String addBooth(@RequestBody BoothVO boothVO) {
    try {
      myboothService.addBooth(boothVO);
      // 리다이렉트 경로를 mypage_booth.jsp로 지정
      return "redirect:/mypage_booth.jsp";
    } catch (Exception e) {
      e.printStackTrace();
      // 에러가 발생한 경우, 에러 메시지를 콘솔에 출력하고 다시 폼 페이지로 이동
      return "redirect:/mypage_booth.jsp";
    }
  }
  @GetMapping("/mypage_booth_add")
  public void getFestivals(Model model) {
    System.out.println("getFestivals test");
    List<FestivalVO> festivals = myboothService.ShowAllfstv();
    model.addAttribute("festivals", festivals);
    System.out.println("getFestivals test : " + festivals);
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