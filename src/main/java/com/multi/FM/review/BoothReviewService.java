package com.multi.FM.review;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoothReviewService {
  
  @Autowired
  BoothReviewDAO dao;

  public List<BoothReviewVO> list(int booth_no) {
    return dao.list(booth_no);
  }
  
  @Transactional
  public void insertReview(BoothReviewVO reviewVO) {
    dao.insertReview(reviewVO);
    
  } 
  
}
