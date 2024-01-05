package com.multi.FM.booth;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.FM.myboothpage.BoothVO;

@Repository
public class BoothDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public List<BoothVO> detail() throws Exception {
		List<BoothVO> detail = my.selectList("detail.list");
		return detail;
	}

	public List<BoothProductVO> product() throws Exception {
		List<BoothProductVO> product = my.selectList("product.list");
		return product;
	}

}