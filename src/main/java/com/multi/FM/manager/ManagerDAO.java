package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.myboothpage.BoothVO;
import com.multi.FM.users.UsersVO;

@Repository
public class ManagerDAO {

  @Autowired
  SqlSessionTemplate my;

  public List<UsersVO> user_list(PagingVO pagingVO) {
    return my.selectList("manager.user_list", pagingVO);
  }

  public List<UsersVO> user_search(PagingVO pagingVO) {
    return my.selectList("manager.user_search", pagingVO);
  }

  public List<UsersVO> ban_user_list(PagingVO pagingVO) {
    return my.selectList("manager.ban_user_list", pagingVO);
  }

  public List<UsersVO> ban_user_search(PagingVO pagingVO) {
    return my.selectList("manager.ban_user_search", pagingVO);
  }

  public UsersVO user_detail(UsersVO usersVO) {
    return my.selectOne("manager.user_detail", usersVO);
  }

  public void update_user(UsersVO usersVO) {
    my.update("manager.update_user", usersVO);
  }

  public List<UsersVO> common_user_list(Map<String, Integer> map) {
    return my.selectList("manager.common_user_list", map);
  }

  public void update_admin(UsersVO usersVO) {
    my.update("manager.update_admin", usersVO);
  }

  public void update_seller(UsersVO usersVO) {
    my.update("manager.update_seller", usersVO);
  }

  public List<BoothVO> booth_list(PagingVO pagingVO) {
    return my.selectList("manager.booth_list", pagingVO);
  }

  public List<BoothVO> booth_search(PagingVO pagingVO) {
    return my.selectList("manager.booth_search", pagingVO);
  }

  public List<BoothVO> ban_booth_list(PagingVO pagingVO) {
    return my.selectList("manager.ban_booth_list", pagingVO);
  }

  public List<BoothVO> ban_booth_search(PagingVO pagingVO) {
    return my.selectList("manager.ban_booth_search", pagingVO);
  }

  public void update_booth(BoothVO boothVO) {
    my.update("manager.update_booth", boothVO);
  }

  public List<ReportVO> report_list(PagingVO pagingVO) {
    return my.selectList("manager.report_list", pagingVO);
  }

  public List<ReportVO> report_search(PagingVO pagingVO) {
    return my.selectList("manager.report_search", pagingVO);
  }

  public ReportVO report_detail(ReportVO reportVO) {
    return my.selectOne("manager.report_detail", reportVO);
  }

  public void update_report(ReportVO reportVO) {
    my.update("manager.update_report", reportVO);
  }

  public List<AskVO> ask_list(PagingVO pagingVO) {
    return my.selectList("manager.ask_list", pagingVO);
  }
  
  public List<AskVO> ask_search(PagingVO pagingVO) {
    return my.selectList("manager.ask_search", pagingVO);
  }

  public AskVO ask_detail(AskVO askVO) {
    return my.selectOne("manager.ask_detail", askVO);
  }

  public void update_ask(AskVO askVO) {
    my.update("manager.update_ask", askVO);
  }
  
  public int total_count(PagingVO pagingVO) {
    return my.selectOne("manager.total_count", pagingVO);
  }

  public int user_count(PagingVO pagingVO) {
    return my.selectOne("manager.user_count", pagingVO);
  }

  public int ban_user_count(PagingVO pagingVO) {
    return my.selectOne("manager.ban_user_count", pagingVO);
  }

  public int booth_count(PagingVO pagingVO) {
    return my.selectOne("manager.booth_count", pagingVO);
  }

  public int ban_booth_count(PagingVO pagingVO) {
    return my.selectOne("manager.ban_booth_count", pagingVO);
  }

  public int report_count(PagingVO pagingVO) {
    return my.selectOne("manager.report_count", pagingVO);
  }
  
  public int ask_count(PagingVO pagingVO) {
    return my.selectOne("manager.ask_count", pagingVO);
  }

  public int total_user_count(Map<String, Integer> map) {
    return my.selectOne("manager.total_user_count", map);
  }

  public List<UsersVO> common_search(Map<String, Integer> map) {
    return my.selectList("manager.common_search", map);
  }

  public int search_user_count(Map<String, Integer> map) {
    return my.selectOne("manager.search_user_count", map);
  }

}
