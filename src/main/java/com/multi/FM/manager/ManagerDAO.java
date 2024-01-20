package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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

	public List<ReportVO> report_list(PagingVO pagingVO) throws Exception {
		return my.selectList("manager.report_list", pagingVO);
	}
    
	public List<ReportVO> report_search(PagingVO pagingVO) throws Exception {
	    return my.selectList("manager.report_search", pagingVO);
	}
    
    public ReportVO report_detail(ReportVO reportVO) {
      return my.selectOne("manager.report_detail", reportVO);
    }

    public List<AskVO> ask_list(PagingVO pagingVO) {
      return my.selectList("manager.ask_list", pagingVO);
    }

    public AskVO ask_detail(AskVO askVO) {
      return my.selectOne("manager.ask_detail", askVO);
    }

    public List<AskVO> ask_search(String type, String word) {
      Map<String, String> parameters = new HashMap<>();
      parameters.put("type", type);
      parameters.put("word", word);
      
      return my.selectList("manager.ask_search", parameters);
    }
    
    public int total_count(PagingVO pagingVO) {
      return my.selectOne("manager.total_count", pagingVO);
    }
    
    public int report_count(PagingVO pagingVO) {
      return my.selectOne("manager.report_count", pagingVO);
    }

    public int user_count(PagingVO pagingVO) {
      return my.selectOne("manager.user_count", pagingVO);
    }

    public int ban_user_count(PagingVO pagingVO) {
      return my.selectOne("manager.ban_user_count", pagingVO);
    }




}