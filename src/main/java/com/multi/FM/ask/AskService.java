package com.multi.FM.ask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.manager.AskVO;

@Service
public class AskService {
  @Autowired
  AskDAO askdao;
  public void insertAsk(AskVO askVO) {
    askdao.insertAsk(askVO);
  }
}
