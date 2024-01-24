package com.multi.FM.booth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
  @Autowired
  private NaverOCR naverOCR;

  public ReceiptVO getOcrResult(byte[] fileBytes) {
    try {
      ReceiptVO ocrResult = naverOCR.ocr(fileBytes);
      return ocrResult;
    } catch (Exception e) {
      e.printStackTrace();
      return null; // 실패 시 null 반환 또는 적절한 처리
    }
  }
}