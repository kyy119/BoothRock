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
  public void user_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("users");
    List<UsersVO> list = service.user_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("user_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("ban_user_list")
  public void ban_user_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("ban_users");
    List<UsersVO> list = service.ban_user_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("ban_user_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("common_user_list1")
  public void common_user_list1(PagingVO pagingVO, int user_black, Model model) {
    pagingVO.Offset();

    List<UsersVO> list = service.common_user_list(pagingVO, user_black);

    int count = service.total_user_count(pagingVO, user_black);
    int pages = pagingVO.getPages(count);

    model.addAttribute("user_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("common_search")
  @ResponseBody
  public Map<String, Object> common_search(PagingVO pagingVO, int user_black, Model model) {
    pagingVO.Offset();
    List<UsersVO> list = service.common_user_list(pagingVO, user_black);

    int search_count = service.search_user_count(pagingVO, user_black);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("list", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }
  
  @RequestMapping("user_search")
  @ResponseBody
  public Map<String, Object> user_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<UsersVO> list = service.user_search(pagingVO);
    
    int search_count = dao.user_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);
    
    Map<String, Object> response = new HashMap<>();
    response.put("user_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);
    
    return response;
  }

  @RequestMapping("ban_user_search")
  @ResponseBody
  public Map<String, Object> ban_user_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<UsersVO> list = service.ban_user_search(pagingVO);

    int search_count = dao.ban_user_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("ban_user_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }

  @RequestMapping("user_detail")
  public void user_detail(UsersVO usersVO, Model model) {
    UsersVO vo = service.user_detail(usersVO);

    model.addAttribute("user_detail", vo);
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
  public void booth_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("booth");
    List<BoothVO> list = service.booth_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("booth_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("booth_search")
  @ResponseBody
  public Map<String, Object> booth_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<BoothVO> list = service.booth_search(pagingVO);

    int search_count = dao.booth_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("booth_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }

  @RequestMapping("ban_booth_list")
  public void ban_booth_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("ban_booth");
    List<BoothVO> list = service.ban_booth_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("ban_booth_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("ban_booth_search")
  @ResponseBody
  public Map<String, Object> ban_booth_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<BoothVO> list = service.ban_booth_search(pagingVO);

    int search_count = dao.ban_booth_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("ban_booth_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }

  @RequestMapping("update_booth")
  public void update_booth(BoothVO boothVO) {
    service.update_booth(boothVO);
  }

  @RequestMapping("report_list")
  public void report_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("report");
    List<ReportVO> list = service.report_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("report_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("report_search")
  @ResponseBody
  public Map<String, Object> report_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<ReportVO> list = service.report_search(pagingVO);

    int search_count = dao.report_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("report_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }

  @RequestMapping("report_detail")
  public void report_detail(ReportVO reportVO, Model model, HttpSession session) {
    ReportVO vo = service.report_detail(reportVO);
    model.addAttribute("report_detail", vo);

    Boolean report_checked = (Boolean) session.getAttribute("report_checked");

    if (report_checked == null || !report_checked) {
      model.addAttribute("report_checked", true);
      session.setAttribute("report_checked", true);
    }
  }

  @RequestMapping("update_report")
  public void update_report(ReportVO reportVO) {
    service.update_report(reportVO);
  }

  @RequestMapping("ask_list")
  public void ask_list(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    pagingVO.setTable("ask");
    List<AskVO> list = service.ask_list(pagingVO);

    int count = dao.total_count(pagingVO);
    int pages = pagingVO.getPages(count);

    model.addAttribute("ask_list", list);
    model.addAttribute("count", count);
    model.addAttribute("pages", pages);
  }

  @RequestMapping("ask_search")
  @ResponseBody
  public Map<String, Object> ask_search(PagingVO pagingVO, Model model) {
    pagingVO.Offset();
    List<AskVO> list = service.ask_search(pagingVO);

    int search_count = dao.ask_count(pagingVO);
    int search_pages = pagingVO.getPages(search_count);

    Map<String, Object> response = new HashMap<>();
    response.put("ask_search", list);
    response.put("search_count", search_count);
    response.put("search_pages", search_pages);

    return response;
  }

  @RequestMapping("ask_detail")
  public void ask_detail(AskVO askVO, Model model) {
    AskVO vo = service.ask_detail(askVO);

    model.addAttribute("ask_detail", vo);
  }

  @RequestMapping("update_ask")
  public void update_ask(AskVO askVO) {
    service.update_ask(askVO);
  }
}
