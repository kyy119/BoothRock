package com.multi.FM.fstv;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FestivalService {
	
	@Autowired
	FestivalDAO dao;
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert() {
		fstvGetApi api = new fstvGetApi();
		ArrayList<FestivalVO> list = api.parse();
		for (int i = 0; i < list.size(); i++) {
			dao.insert(list.get(i));
		}
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
	
	public List<FestivalVO> list() {
		return dao.list();
	}
	
    public List<FestivalVO> jjim(FestivalPageVO fstvpageVO) {
      return dao.jjim(fstvpageVO);
    }
	
	public FestivalVO one(FestivalVO festivalVO) {
      return dao.one(festivalVO);
    }
	
    public List<FestivalVO> date(FestivalPageVO vo) {
      return dao.date(vo);
    }
    
    public List<FestivalVO> date_jjim(FestivalPageVO fstvpageVO) {
      return dao.date_jjim(fstvpageVO);
    }
    
    public List<FestivalBoothVO> booth_in(FestivalVO vo) {
      return dao.booth_in(vo);
    }
    
    public List<FestivalBoothVO> booth_star(FestivalVO vo) {
      return dao.booth_star(vo);
    }
    
    public List<FestivalVO> search(String q) {
      return dao.search(q);
    }
    
    public List<FestivalVO> map(String region) {
      return dao.map(region);
    }
    
    public List<FestivalVO> mapJ(String region) {
      return dao.mapJ(region);
    }
    
    public int jjimSearch(JjimVO jvo) {
      return my.selectOne("fest.jjimsearch",jvo);
    }
    
    public int jjimChu(JjimVO jvo) {
      int res = my.selectOne("fest.jjimsearch",jvo);
      int cnt = my.selectOne("fest.jjimcnt", jvo);
      if(res==1) {
        cnt--;
        jvo.setFstv_jjimCount(cnt);
        dao.jjimsak(jvo);
        return 0;
      } else {
        cnt++;
        jvo.setFstv_jjimCount(cnt);
        dao.jjimchu(jvo);
        return 1;
      }
    }
    
    public List<FestivalBoothVO> boothup() {
      return dao.boothup();
    }
    
}
