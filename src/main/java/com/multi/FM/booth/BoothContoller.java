package com.multi.FM.booth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.FM.myboothpage.BoothVO;

@Controller 
public class BoothContoller {

	@Autowired
	boothDAO dao;
		
	@Autowired
	BoothVO bvo;
	
	//booth 상세 페이지
	@RequestMapping("/detail")
	public String detail(Model model) throws Exception {
        List<BoothVO> detail = dao.detail();
        model.addAttribute("booth_detail", detail);
        return "booth_detail"; // 반환값으로 View 이름 반환
    }//detail
	
}//class
