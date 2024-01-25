package com.multi.FM.booth;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("review")
public class BoothReviewContoller {

  @Autowired
  BoothDAO dao;
  
  @Autowired
  BoothReviewService boothRSV;
  
  @Autowired
  BoothService boothSV;

  
  // review 리스트(더보기)
  @RequestMapping("booth_review")
  public String review(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothReviewVO> boothReview = boothRSV.list(booth_no);
      model.addAttribute("boothReview", boothReview);
      return "review/booth_review"; 
  }// review list
  
  //review의 부스정보 불러오기
  @RequestMapping("booth_detail_review")
  public String detail_review(@RequestParam("booth_no") int booth_no, Model model) {
      List<BoothReviewVO> boothDetailReview = boothRSV.list(booth_no);
      model.addAttribute("boothDetailReview", boothDetailReview);
      return "review/booth_detail_review"; 
  }// booth_detail_review list
  
  //ocr 검증
  @PostMapping("/ocr_auth")
  @ResponseBody
  public String ocr_auth(@RequestPart("file") MultipartFile file) {
      try {
          // 파일을 서버에 저장
          byte[] fileBytes = file.getBytes();

          // OCR 처리 로직
          NaverOCR naverOCR = new NaverOCR();
          ReceiptVO ocrResultList = naverOCR.ocr(fileBytes);
          
          // 이 부분이 추가되었습니다. OCR 결과를 어딘가에 활용하거나 저장할 수 있습니다.
          // 아래는 예시로 콘솔에 출력하는 코드입니다.
          if (ocrResultList != null) {
              System.out.println("OCR 결과: " + ocrResultList);
          }

          // 처리 결과에 따라 응답을 반환할 수 있습니다.
          return "success";
      } catch (Exception e) {
          e.printStackTrace(); // 예외 처리를 적절히 수행
          return "error";
      }
  }
  
 
  
}// class
