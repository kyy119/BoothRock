package com.multi.FM.ask;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.manager.AskVO;

@Repository
public class AskDAO {
  @Autowired
  SqlSessionTemplate my;
   public void insertAsk(AskVO askVO) {
     my.insert("ask.insertAsk",askVO);
   }
  
}
