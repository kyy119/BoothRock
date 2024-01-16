package com.multi.FM.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("report_list")
	public void list(Model model) throws Exception {
		List<ReportVO> report_list = dao.list();
		model.addAttribute("report_list", report_list);
	}
}
