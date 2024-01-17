package com.multi.FM.report;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.multi.FM.booth.BoothReviewVO;


@Controller
public class BoothReportController {

  @Autowired
  BoothReportDAO dao;
  
  @Autowired
  BoothReportService reportSV;
  
  @RequestMapping("duplicate_report_check")
  public String duplicateReportCheck(@RequestParam("booth_no") int booth_no, HttpSession session,
                                     RedirectAttributes redirectAttributes, Model model) { 
   
        String user_id = (String) session.getAttribute("id");
        boolean isDuplicate = reportSV.checkDuplicateReport(user_id, booth_no);
        if (isDuplicate) {
            // 중복이면 에러 메시지
            // FlashAttribute : 데이터가 세션에 저장되어 리다이렉트 되는 페이지에서만 사용가능. 
            //                  다음 요청에서는 사용된 후에 자동으로 제거_데이터가 단발성으로 사용되어야 하는 경우에 유용
            redirectAttributes.addFlashAttribute("DuplicateTrue", "이미 신고하신 부스입니다.");
            return "redirect:/booth_detail";
        } 
        model.addAttribute("booth_no", booth_no);
        return "booth_report";
  }
  
  @PostMapping("insertReport")
  public String submitReport(@RequestParam("report_title") String report_title,
                             @RequestParam("report_comment") String report_comment,
                             @RequestParam("user_id") String user_id,
                             @RequestParam("booth_no") int booth_no, HttpSession session,
                             RedirectAttributes redirectAttributes, Model model) {
      reportSV.insertReport(report_title, report_comment, booth_no, user_id);
      redirectAttributes.addFlashAttribute("booth_no", booth_no);
      redirectAttributes.addFlashAttribute("showAlert", true);
      System.out.println("report insert 호출");
      return "redirect:/booth_detail";
  }
  
  @RequestMapping("booth_detail_report")
  public String booth_detail_report(@RequestParam("booth_no") int booth_no, Model model) {
      BoothReportVO boothDetailReport = reportSV.boothDetailReport(booth_no);
      model.addAttribute("boothDetailReport", boothDetailReport);
      return "booth_detail_report"; 
  }
}
