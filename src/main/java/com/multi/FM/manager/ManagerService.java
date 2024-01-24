package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.myboothpage.BoothVO;
import com.multi.FM.users.UsersVO;

@Service
public class ManagerService {

  @Autowired
  ManagerDAO dao;

  public List<UsersVO> user_list(PagingVO pagingVO) {
    return dao.user_list(pagingVO);
  }

  public List<UsersVO> user_search(PagingVO pagingVO) {
    return dao.user_search(pagingVO);
  }

  public List<UsersVO> ban_user_list(PagingVO pagingVO) {
    return dao.ban_user_list(pagingVO);
  }

  public List<UsersVO> ban_user_search(PagingVO pagingVO) {
    return dao.ban_user_search(pagingVO);
  }

  public UsersVO user_detail(UsersVO usersVO) {
    return dao.user_detail(usersVO);
  }

  public void update_user(UsersVO usersVO) {
    dao.update_user(usersVO);
  }

  public void update_admin(UsersVO usersVO) {
    dao.update_admin(usersVO);
  }

  public void update_seller(UsersVO usersVO) {
    dao.update_seller(usersVO);
  }

  public List<BoothVO> booth_list(PagingVO pagingVO) {
    return dao.booth_list(pagingVO);
  }

  public List<BoothVO> booth_search(PagingVO pagingVO) {
    return dao.booth_search(pagingVO);
  }

  public List<BoothVO> ban_booth_list(PagingVO pagingVO) {
    return dao.ban_booth_list(pagingVO);
  }

  public List<BoothVO> ban_booth_search(PagingVO pagingVO) {
    return dao.ban_booth_search(pagingVO);
  }

  public void update_booth(BoothVO boothVO) {
    dao.update_booth(boothVO);
  }

  public List<ReportVO> report_list(PagingVO pagingVO) {
    return dao.report_list(pagingVO);
  }

  public List<ReportVO> report_search(PagingVO pagingVO) {
    return dao.report_search(pagingVO);
  }

  public ReportVO report_detail(ReportVO reportVO) {
    return dao.report_detail(reportVO);
  }

  public void update_report(ReportVO reportVO) {
    dao.update_report(reportVO);
  }

  public List<AskVO> ask_list(PagingVO pagingVO) {
    return dao.ask_list(pagingVO);
  }

  public List<AskVO> ask_search(PagingVO pagingVO) {
    return dao.ask_search(pagingVO);
  }

  public AskVO ask_detail(AskVO askVO) {
    return dao.ask_detail(askVO);
  }

  public void update_ask(AskVO askVO) {
    dao.update_ask(askVO);
  }

  public List<UsersVO> common_user_list(PagingVO pagingVO, int user_black) {
    Map<String, Integer> map = new HashMap();
    map.put("user_black", user_black);
    map.put("offset", pagingVO.getOffset());
    return dao.common_user_list(map);
  }

  public int total_user_count(PagingVO pagingVO, int user_black) {
    Map<String, Integer> map = new HashMap<>();
    map.put("user_black", user_black);
    return dao.total_user_count(map);
  }

  public List<UsersVO> common_search(PagingVO pagingVO, int user_black) {
    Map<String, Integer> map = new HashMap();
    map.put("user_black", user_black);
    map.put("offset", pagingVO.getOffset());
    return dao.common_search(map);
  }

  public int search_user_count(PagingVO pagingVO, int user_black) {
    Map<String, Integer> map = new HashMap<>();
    map.put("user_black", user_black);
    return dao.search_user_count(map);
  }
}
