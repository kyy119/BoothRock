package com.multi.FM.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
  @Autowired
  private NaverOCR naverOCR;
  
  @Autowired
  ReceiptDAO dao;


  public void saveReceipt(ReceiptVO receiptVO) {
    dao.saveReceipt(receiptVO);
  }

  public String isDuplicate(ReceiptVO receiptVO, int booth_no) {
    try {
      String selling_number= receiptVO.getSelling_number();
      // 첫 번째 확인 로직: user_id 기준으로 selling_number 조회하여 일치 여부 확인
      String sellingNumber = dao.getSellingNumber(booth_no);
      System.out.println(sellingNumber);
      if (sellingNumber != null && !sellingNumber.equals(selling_number)) {
          // selling_number가 일치하지 않으면
        return "sell_no_false";
      }else{//sellingNumber != null && sellingNumber.equals(selling_number)
        // selling_number가 일치하면
        // 두 번째 확인 로직: transaction_date 기준으로 중복 확인
        String date = receiptVO.getTransaction_date();
        long count = dao.countByTransactionDate(date);
        // 레코드 개수가 1 이상이면 중복, 아니면 중복이 아님
        return count > 0 ? "date_false" : "date_true";
      }
  } catch (Exception e) {
      e.printStackTrace(); 
      return "error"; // 에러가 발생하면 중복으로 처리
  }
  }
}