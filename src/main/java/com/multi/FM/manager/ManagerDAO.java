package com.multi.FM.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<ReportVO> report_list() throws Exception {
		return my.selectList("report.report_list");
	}
    
    public List<ReportVO> report_search(String type, String word) throws Exception {
        Map<String, String> parameters = new HashMap<>();
        parameters.put("type", type);
        parameters.put("word", word);
        
        return my.selectList("report.report_search", parameters);
    }
    
    public ReportVO report_detail(ReportVO reportVO) {
      return my.selectOne("report.report_detail", reportVO);
    }
    
}