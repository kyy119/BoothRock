package com.multi.FM.myboothpage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyboothDAO {
  @Autowired
  SqlSessionTemplate my;
  
  public void addbooth(BoothVO boothVO) {
    my.insert("MyboothMapper.insertBooth",boothVO);
  }
}
