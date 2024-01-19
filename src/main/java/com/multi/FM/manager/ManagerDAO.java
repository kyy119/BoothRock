package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {

	@Autowired
	SqlSessionTemplate my;
	
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
    
    public int total_count() {
      return my.selectOne("manager.total_count");
    }
    
    public int report_count(PagingVO pagingVO) {
      return my.selectOne("manager.report_count", pagingVO);
    }
    
}