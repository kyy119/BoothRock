package com.multi.FM.myboothpage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoothDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
}
