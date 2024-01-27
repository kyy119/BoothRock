package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.multi.FM.myboothpage.BoothVO;
import com.multi.FM.users.UsersVO;

@Controller
@RequestMapping("manager")
public class ManagerController {

  @Autowired
  ManagerDAO dao;

  @Autowired
  ManagerService service;

  @RequestMapping("user_list")
  public void user_list(PagingVO pagingVO, int user_black, Model model) {
    pagingVO.Offset();

    List<UsersVO> list = service.user_list(pagingVO, user_black);

    int count = service.user_count(pagingVO, user_black);
    int pages = pagingVO.getPages(count);

    model.addAttribute("list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("user_detail")
  public void user_detail(UsersVO usersVO, Model model) {
    UsersVO vo = service.user_detail(usersVO);

    model.addAttribute("vo", vo);
  }

  @RequestMapping("update_user")
  public void update_user(UsersVO usersVO) {
    service.update_user(usersVO);
  }

  @RequestMapping("update_admin")
  public void update_admin(UsersVO usersVO) {
    service.update_admin(usersVO);
  }

  @RequestMapping("update_seller")
  public void update_seller(UsersVO usersVO) {
    service.update_seller(usersVO);
  }

  @RequestMapping("booth_list")
  public void booth_list(PagingVO pagingVO, int booth_ban, Model model) {
    pagingVO.Offset();
    List<BoothVO> list = service.booth_list(pagingVO, booth_ban);

    int count = service.booth_count(pagingVO, booth_ban);
    int pages = pagingVO.getPages(count);

    model.addAttribute("list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("update_booth")
  public void update_booth(BoothVO boothVO) {
    service.update_booth(boothVO);
  }
  
  @RequestMapping("delete_booth")
  public void delete_booth(BoothVO boothVO) {
    service.delete_booth(boothVO);
  }

  @RequestMapping("report_list")
  public void report_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<ReportVO> list = service.report_list(pagingVO);

    int count = service.report_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("report_detail")
  public void report_detail(ReportVO reportVO, Model model, HttpSession session) {
    ReportVO vo = service.report_detail(reportVO);
    Integer report_check = (Integer) session.getAttribute("report_check");

    if (report_check == null || report_check == 0) {
      session.setAttribute("report_check", 1);
      service.report_check(reportVO);
    }

    model.addAttribute("vo", vo);
  }

  @RequestMapping("update_report")
  public void update_report(ReportVO reportVO) {
    service.update_report(reportVO);
  }

  @RequestMapping("ask_list")
  public void ask_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<AskVO> list = service.ask_list(pagingVO);

    int count = service.ask_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("ask_detail")
  public void ask_detail(AskVO askVO, Model model) {
    AskVO vo = service.ask_detail(askVO);

    model.addAttribute("vo", vo);
  }

  @RequestMapping("update_ask")
  public void update_ask(AskVO askVO) {
    service.update_ask(askVO);
  }
}
