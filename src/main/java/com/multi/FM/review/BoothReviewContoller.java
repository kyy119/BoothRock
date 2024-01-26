package com.multi.FM.review;

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
import com.multi.FM.booth.BoothDAO;



@Controller
//@PropertySource("classpath:key.properties")
@RequestMapping("review")
public class BoothReviewContoller {

  @Autowired
  BoothDAO dao;
  
  @Autowired
  BoothReviewService boothRSV;
  
  @Autowired
  ReceiptService receiptService;
  
  //@Autowired
  //static ApplicationContext ctx;

  @Autowired
  ApiKey return_key;
  
  public BoothReviewContoller() {
    
      // System.out.println("ocrSecretKey: " + secretKey);
       //Environment env = ctx.getEnvironment();
       //System.out.println(env.getProperty("ocr.secretKey"));
     } 

  
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
  public String ocr_auth(@RequestPart("file") MultipartFile file,
                         @RequestParam(value = "user_id", required = false) String user_id) {
  //  Environment env = ctx.getEnvironment();
  // String key= env.getProperty("ocr.secretKey");
    String key = return_key.key();
      try {
          System.out.println("서버에서 받은 사용자 ID: " + user_id);

          byte[] fileBytes = file.getBytes();

          // OCR 처리 로직
          NaverOCR naverOCR = new NaverOCR();
          ReceiptVO receiptVO = naverOCR.ocr(fileBytes, user_id, key);

          if (receiptVO != null) {
              // 중복 데이터 확인
              if (!receiptService.isDuplicate(receiptVO)) {
                  // 중복되지 않으면 저장
                  receiptService.saveReceipt(receiptVO);
                  return "success";
              } else {
                  return "duplicate";
              }
          } else {
              return "error";
          }
      } catch (Exception e) {
          e.printStackTrace(); 
          return "error";
      }
  }
  
  @RequestMapping("/go_booth_review_write")
  public String goToBoothReviewWrite() {
      return "review/booth_review_write";
  }
 
  
}// class
