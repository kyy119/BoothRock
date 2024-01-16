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
@RequestMapping("/booth")
public class MyBoothController {

  @Autowired
  private MyboothService MyboothService;
//
//  @GetMapping("/add")
//  public String showBoothForm(Model model) {
//    // Populate model with festival data from the database
//    List<Festival> festivals = festivalService.getAllFestivals();
//    model.addAttribute("festivals", festivals);
//    model.addAttribute("booth", new Booth());
//    return "mypage_booth_add";
//  }
//
  @PostMapping("/add")
  public String addBooth(BoothVO boothVO) {
    MyboothService.addBooth(boothVO);
    return "redirect:/mypage_booth.jsp"; // Redirect to the booth management page
  }
  @GetMapping("/booths")
  public String showFestivalForm(Model model) {
    System.out.println("Festivals: test");
    List<FestivalVO> festivals = MyboothService.ShowAllfstv();
    model.addAttribute("festivals", festivals);
    System.out.println("Festivals: " + festivals);
    return "mypage_booth_add";
  }
}