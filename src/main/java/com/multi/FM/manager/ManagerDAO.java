package com.multi.FM.manager;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<ReportVO> list() throws Exception {
		List<ReportVO> list = my.selectList("report.list");
		return list;
	}
}