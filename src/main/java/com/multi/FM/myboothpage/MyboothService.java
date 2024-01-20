package com.multi.FM.myboothpage;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.booth.BoothProductVO;
import com.multi.FM.fstv.FestivalVO;

@Service
public class MyboothService {
  @Autowired
  MyboothDAO myboothdao;

  public void addBooth(BoothVO boothVO) {
    myboothdao.addbooth(boothVO);
  }
  public List<FestivalVO> ShowAllfstv(){
    return myboothdao.showAllfstv();
  }
  public void addBoothProduct(BoothProductVO boothProductVO) {
    myboothdao.addBoothProduct(boothProductVO);
  }
  public List<BoothVO> showMybooth(String user_id){
    return myboothdao.showMybooth(user_id);
  }
  public void deleteBooth(int boothNo) {
    // 부스 삭제 DAO 메서드 호출
    myboothdao.deleteBooth(boothNo);
  }
  public BoothVO getBoothDetailsByNo(int boothNo) {
    return myboothdao.getBoothDetailsByNo(boothNo);
  }
  public List<BoothProductVO> getBoothProductByNo(int boothNo){
    return myboothdao.getBoothProductByNo(boothNo);
  }
}
