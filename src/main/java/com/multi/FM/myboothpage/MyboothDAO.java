package com.multi.FM.myboothpage;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.fstv.FestivalVO;

@Repository
public class MyboothDAO {
  @Autowired
  SqlSessionTemplate my;
  
  public void addbooth(BoothVO boothVO) {
    my.insert("MyboothMapper.insertBooth",boothVO);
  }
  public List<FestivalVO> showAllfstv() {
    return my.selectList("Mybooth.getAllFestivals");
  }
}
