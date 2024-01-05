package com.multi.FM.fstv;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FestivalService {
	
	@Autowired
	FestivalDAO dao;
	
	public ArrayList<FestivalVO> insert() {
		fstvGetApi api = new fstvGetApi();
		ArrayList<FestivalVO> list = api.parse();
		for (int i = 0; i < list.size(); i++) {
			dao.insert(list.get(i));
		}
		return list;
	}
	
	public List<FestivalVO> banner() {
		return dao.banner();
	}
	
	public List<FestivalVO> end() {
		return dao.end();
	}
	
	public int cnt() {
		return dao.cnt();
	}
	
	public List<FestivalVO>list(FstvPageVO fstvPageVO) {
		return dao.list(fstvPageVO);
	}
	
}
