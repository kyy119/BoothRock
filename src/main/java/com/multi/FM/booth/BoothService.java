package com.multi.FM.booth;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.myboothpage.BoothVO;

@Service
public class BoothService {
  
  @Autowired
  BoothDAO dao;
  
  public BoothVO detail(BoothVO boothVO) {
    return dao.detail(boothVO);
  }
  
  public List<BoothProductVO> product() {
    return dao.product();
  }

}
