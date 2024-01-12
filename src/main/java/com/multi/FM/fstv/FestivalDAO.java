package com.multi.FM.fstv;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.myboothpage.BoothVO;

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

  public List<FestivalVO> list() {
    List<FestivalVO> total = new ArrayList<FestivalVO>();
    List<FestivalVO> data1 = my.selectList("fest.list1");
    List<FestivalVO> data2 = my.selectList("fest.list2");
    List<FestivalVO> data3 = my.selectList("fest.list3");
    total.addAll(data1);
    total.addAll(data2);
    total.addAll(data3);
    return total;
  }
  
  public List<FestivalVO> jjim(FestivalPageVO fstvpageVO) {
    return my.selectList("fest.jjim", fstvpageVO);
  }
  
  public FestivalVO one(FestivalVO festivalVO) {
    return my.selectOne("fest.one", festivalVO);
  }
  
  public List<FestivalVO> date(FestivalPageVO vo) {
    return my.selectList("fest.date", vo);
  }
  
  public List<FestivalBoothVO> booth_in(FestivalVO vo) {
    return my.selectList("fest.booth_in", vo);
  }

  public List<FestivalBoothVO> booth_star(FestivalVO vo) {
    return my.selectList("fest.booth_star", vo);
  }
  
  public List<FestivalVO> search(String q) {
    return my.selectList("fest.search", q);
  }
}
