package com.multi.FM.review;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.myboothpage.BoothVO;

@Service
public class BoothReviewService {
  
  @Autowired
  BoothReviewDAO dao;

  public List<BoothReviewVO> list(int booth_no) {
    return dao.list(booth_no);
  }

}
