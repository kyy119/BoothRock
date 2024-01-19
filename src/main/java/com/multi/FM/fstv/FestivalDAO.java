package com.multi.FM.fstv;

import java.util.ArrayList;
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
    List<FestivalVO> total = new ArrayList<FestivalVO>();
    try {
        List<FestivalVO> data1 = my.selectList("fest.search1", q);
        total.addAll(data1);
    } catch (Exception e) {}
    try {
      List<FestivalVO> data2 = my.selectList("fest.search2", q);
      total.addAll(data2);
    } catch (Exception e) {}
    try {
      List<FestivalVO> data3 = my.selectList("fest.search3", q);
      total.addAll(data3);
    } catch (Exception e) {}
    return total;
  }
  
  public List<FestivalVO> map(String region) {
    List<FestivalVO> total = new ArrayList<FestivalVO>();
    try {
      List<FestivalVO> data1 = my.selectList("fest.map1", region);
      total.addAll(data1);
    } catch (Exception e) {}
    try {
      List<FestivalVO> data2 = my.selectList("fest.map2", region);
      total.addAll(data2);
    } catch (Exception e) {}
    try {
      List<FestivalVO> data3 = my.selectList("fest.map3", region);
      total.addAll(data3);
    } catch (Exception e) {}
    return total;
  }
  
  public List<FestivalVO> mapJ(String region) {
    return my.selectList("fest.mapJ", region);
  }
  
  public void jjimchu(JjimVO jvo) {
    my.update("fest.upcnt",jvo);
    my.insert("fest.jjimchu", jvo);
  }
  
  public void jjimsak(JjimVO jvo) {
    my.update("fest.upcnt",jvo);
    my.delete("fest.jjimsak",jvo);
  }
  
  public List<FestivalBoothVO> boothup() {
    return my.selectList("fest.boothup");
  }
  
}
