package com.multi.FM.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
  @Autowired
  private NaverOCR naverOCR;
  
  @Autowired
  ReceiptDAO dao;

  public ReceiptVO getOcrResult(byte[] fileBytes,String user_id) {
    try {
      ReceiptVO ocrResult = naverOCR.ocr(fileBytes, user_id);
      return ocrResult;
    } catch (Exception e) {
      e.printStackTrace();
      return null; // 실패 시 null 반환 또는 적절한 처리
    }
  }

  public void saveReceipt(ReceiptVO receiptVO) {
    dao.saveReceipt(receiptVO);
  }

  public boolean isDuplicate(ReceiptVO receiptVO) {
    try {
      String date = receiptVO.getTransaction_date();

      long count = dao.countByTransactionDate(date);

      // 레코드 개수가 1 이상이면 중복, 아니면 중복이 아님
      return count > 0;
  } catch (Exception e) {
      e.printStackTrace(); 
      return true; // 에러가 발생하면 중복으로 처리
  }
  }
}