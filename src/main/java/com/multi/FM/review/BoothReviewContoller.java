package com.multi.FM.review;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.multi.FM.booth.BoothDAO;
import com.multi.FM.booth.BoothService;
import com.multi.FM.myboothpage.BoothVO;



@Controller
// @PropertySource("classpath:key.properties")
@RequestMapping("review")
public class BoothReviewContoller {

  @Autowired
  BoothDAO dao;

  @Autowired
  BoothReviewService boothRSV;

  @Autowired
  ReceiptService receiptService;

  @Autowired
  BoothService boothSV;

  @Autowired
  ApiKey return_key;

  public BoothReviewContoller() {

    // System.out.println("ocrSecretKey: " + secretKey);
    // Environment env = ctx.getEnvironment();
    // System.out.println(env.getProperty("ocr.secretKey"));
  }


  // review 리스트(더보기)
  @RequestMapping("booth_review")
  public String review(@RequestParam("booth_no") int booth_no, Model model) {
    List<BoothReviewVO> boothReview = boothRSV.list(booth_no);
    model.addAttribute("boothReview", boothReview);
    return "review/booth_review";
  }// review list

  // review의 부스정보 불러오기
  @RequestMapping("booth_detail_review")
  public String detail_review(@RequestParam("booth_no") int booth_no, Model model) {
    List<BoothReviewVO> boothDetailReview = boothRSV.list(booth_no);
    model.addAttribute("boothDetailReview", boothDetailReview);
    return "review/booth_detail_review";
  }// booth_detail_review list

  // ocr 검증
  @PostMapping("/ocr_auth")
  @ResponseBody
  public String ocr_auth(@RequestPart("file") MultipartFile file,
      @RequestParam(value = "user_id", required = false) String user_id, int booth_no) {
    String key = return_key.key();

    try {
      byte[] fileBytes = file.getBytes();

      // OCR 처리 로직
      NaverOCR naverOCR = new NaverOCR();
      ReceiptVO receiptVO = naverOCR.ocr(fileBytes, user_id, key);

      if (receiptVO != null) {
        String result = receiptService.isDuplicate(receiptVO, booth_no);
        // 중복 데이터 확인
          if (result.equals("sell_no_false")) {
            return "not_equal_sell_no";
          } else if (result.equals("date_false")) {
            return "duplicate";
          }else {//result.equals("date_true")반환
            receiptService.saveReceipt(receiptVO);
            return "success";   
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
  public String go_booth_review_write(@RequestParam("booth_no") int booth_no, Model model,
      BoothVO boothVO) {
    BoothVO boothDetail = boothSV.detail(boothVO);
    model.addAttribute("boothDetail", boothDetail);
    return "review/booth_review_write";
  }

  @PostMapping("/insert_review")
  public ResponseEntity<BoothReviewVO> insertReview(@RequestBody BoothReviewVO reviewVO) {
    try {
      boothRSV.insertReview(reviewVO);
      return ResponseEntity.ok(reviewVO);
    } catch (Exception e) {
      e.printStackTrace(); // 예외를 콘솔에 출력
      return ResponseEntity.status(500).body(null);
    }
  }



}// class
