package com.multi.FM.mypage;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
    
    @RequestMapping("mypage_edit")
    public void mypage_edit() throws Exception {
        
    }
    
    @RequestMapping("mypage_jjimlist")
    public void mypage_jjimlist() throws Exception{
    
    }
    
    @RequestMapping("mypage_review")
    public void mypage_review() throws Exception{
        System.out.println("test");
    }
    
    @RequestMapping("mypage_ask")
    public void mypage_ask() throws Exception{
        
    }
    
    @RequestMapping("mypage_booth")
    public void mypage_booth() throws Exception{
    
    }
}
