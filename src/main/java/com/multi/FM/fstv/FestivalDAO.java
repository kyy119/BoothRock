package com.multi.FM.fstv;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FestivalDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(FestivalVO festivalVO) {
		try {
			my.insert("fest.insert", festivalVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<FestivalVO> banner() {
		return my.selectList("fest.bannerlist");
	}
	
	public List<FestivalVO> end() {
		return my.selectList("fest.endlist");
	}
	
	public int cnt() {
		int c = my.selectOne("fest.cnt");
		return c;
	}
	
	public List<FestivalVO> list(FstvPageVO fstvPageVO) {
		return my.selectList("fest.list", fstvPageVO);
	}
	
}
