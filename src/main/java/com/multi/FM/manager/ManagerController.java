package com.multi.FM.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerDAO dao;
	
	@Autowired
	ManagerService service;
	
	@RequestMapping("report_list")
	public void report_list(ReportVO reportVO, Model model) throws Exception {
		List<ReportVO> list = service.report_list();
		model.addAttribute("report_list", list);
	}

	@RequestMapping(value="report_search", produces = "text/html; charset=utf8")
	@ResponseBody
	public String report_search(@RequestParam(value = "type", required = false) String type,
	                            @RequestParam(value = "word", required = false) String word) throws Exception {
	  
	    List<ReportVO> searchResult = service.report_search(type, word);
        return HtmlResult(searchResult);
	}

	private String HtmlResult(List<ReportVO> searchResult) {

	    StringBuilder htmlBuilder = new StringBuilder();
	    for (ReportVO report : searchResult) {
	        htmlBuilder.append("<tr>");
	        htmlBuilder.append("<td>").append(report.getReport_no()).append("</td>");
	        htmlBuilder.append("<td><a href=\"report_detail?report_no=").append(report.getReport_no()).append("\">").append(report.getReport_title()).append("</a></td>");
	        htmlBuilder.append("<td><a href=\"user_detail.jsp\">").append(report.getUser_id()).append("</a></td>");
	        htmlBuilder.append("<td><a href=\"booth_detail?booth_no=").append(report.getBooth_name()).append("\">").append(report.getBooth_name()).append("</a></td>");
	        htmlBuilder.append("<td>").append(report.getReport_date()).append("</td>");
	        htmlBuilder.append("</tr>");
	        
	    }
	    return htmlBuilder.toString();
	}

  @RequestMapping("report_detail")
	public void report_detail(ReportVO reportVO, Model model) {
	  ReportVO vo = service.report_detail(reportVO);
	  model.addAttribute("report_detail", vo);
	}
	
}
