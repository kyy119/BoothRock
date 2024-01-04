package com.multi.FM.myboothpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.*;
@Controller
@RequestMapping("/booth")
public class MyBoothController {
//	
//	@Autowired
//    private BoothService boothService;
//	
//	@GetMapping("/add")
//    public String showBoothForm(Model model) {
//        // Populate model with festival data from the database
//        List<Festival> festivals = festivalService.getAllFestivals();
//        model.addAttribute("festivals", festivals);
//        model.addAttribute("booth", new Booth());
//        return "mypage_booth_add";
//    }
//
//    @PostMapping("/add")
//    public String addBooth(@ModelAttribute BoothVO boothVO) {
//        boothService.addBooth(boothVO);
//        return "redirect:/mypage_booth.jsp"; // Redirect to the booth management page
//    }
}