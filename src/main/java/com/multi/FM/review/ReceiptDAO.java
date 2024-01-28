package com.multi.FM.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.myboothpage.BoothVO;

@Repository
public class ReceiptDAO {
  @Autowired
  SqlSessionTemplate my;

  public void saveReceipt(ReceiptVO receiptVO) {
    my.insert("booth.saveReceipt", receiptVO);
    
  }

  public long countByTransactionDate(String date) {
    
    return my.selectOne("booth.countByTransactionDate", date);
  }

  public String getSellingNumber(int booth_no) {
    return my.selectOne("booth.getSellingNumber", booth_no);
  }

   
}
