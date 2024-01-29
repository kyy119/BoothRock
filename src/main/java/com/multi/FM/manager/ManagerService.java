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

  public List<UsersVO> user_list(PagingVO pagingVO, int user_black) {
    return dao.user_list(pagingVO);
  }

  public int user_count(PagingVO pagingVO, int user_black) {
    return dao.user_count(pagingVO);
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

  public List<BoothVO> booth_list(PagingVO pagingVO, int booth_ban) {
    return dao.booth_list(pagingVO);
  }

  public int booth_count(PagingVO pagingVO, int booth_ban) {
    return dao.booth_count(pagingVO);
  }

  public void update_booth(BoothVO boothVO) {
    dao.update_booth(boothVO);
  }
  
  public void delete_booth(BoothVO boothVO) {
    dao.delete_booth(boothVO);
  }

  public List<ReportVO> report_list(PagingVO pagingVO) {
    return dao.report_list(pagingVO);
  }

  public int report_count(PagingVO pagingVO) {
    return dao.report_count(pagingVO);
  }

  public ReportVO report_detail(ReportVO reportVO) {
    return dao.report_detail(reportVO);
  }

  public void update_report(ReportVO reportVO) {
    dao.update_report(reportVO);
  }

  public void report_checked(ReportVO reportVO) {
    dao.report_checked(reportVO);
  }

  public List<AskVO> ask_list(PagingVO pagingVO) {
    return dao.ask_list(pagingVO);
  }

  public int ask_count(PagingVO pagingVO) {
    return dao.ask_count(pagingVO);
  }

  public AskVO ask_detail(AskVO askVO) {
    return dao.ask_detail(askVO);
  }

  public void update_ask(AskVO askVO) {
    dao.update_ask(askVO);
  }

}
