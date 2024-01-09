package com.multi.FM.myboothpage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyboothService {
  @Autowired
  MyboothDAO myboothdao;
  
  public void addBooth(BoothVO boothVO) {
    myboothdao.addbooth(boothVO);
  }
}
