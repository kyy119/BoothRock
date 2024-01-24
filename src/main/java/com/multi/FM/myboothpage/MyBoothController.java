package com.multi.FM.myboothpage;

import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.multi.FM.booth.BoothProductVO;
import com.multi.FM.fstv.FestivalVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("mypage")
public class MyBoothController {

  @Autowired
  private MyboothService myboothService;
  
  @Autowired
  private AwsS3Biz awsS3Biz; 

  @PostMapping("add-product")
  @ResponseBody // 뷰 없이 직접 응답 반환을 위해
  public String addBoothProduct(@RequestBody BoothProductVO boothProductVO) {
    try {
      myboothService.addBoothProduct(boothProductVO);
      // 성공적으로 상품을 추가한 경우 메시지를 반환하거나 다른 적절한 처리를 추가할 수 있습니다.
      return "success_test";
    } catch (Exception e) {
      e.printStackTrace();
      // 에러가 발생한 경우, 에러 메시지를 반환하거나 다른 적절한 처리를 추가할 수 있습니다.
      return "Error adding booth product.";
    }
  }

  @RequestMapping(value = "add", method = RequestMethod.POST)
  @ResponseBody
  public String addBooth(@RequestBody BoothVO boothVO) {
    System.out.println(boothVO.getBooth_name());
    System.out.println(boothVO.getFstv_no());
    System.out.println(boothVO.getBooth_addr());
    System.out.println(boothVO.getBooth_category());
    System.out.println(boothVO.getBooth_hours());
    System.out.println(boothVO.getSeller_id());
    try {
      myboothService.addBooth(boothVO);
      System.out.println("success");

      return String.valueOf(boothVO.getBooth_no());
    } catch (Exception e) {
      e.printStackTrace();
      // 에러가 발생한 경우, 에러 메시지를 콘솔에 출력하고 다시 폼 페이지로 이동-
      System.out.println("error");
      return "fail";
    }
  }
  @RequestMapping("mypage_booth")
  public void mybooth(String user_id, Model model){
    System.out.println("mybooth test");
    List<BoothVO> mybooths = myboothService.showMybooth(user_id);
    System.out.println("user_id : " + user_id);
    for (BoothVO booth : mybooths) {
      System.out.println("booth_no: " + booth.getBooth_no());
      System.out.println("booth_image: " + booth.getBooth_image());
      System.out.println("fstv_no: " + booth.getFstv_no());
      System.out.println("booth_name: " + booth.getBooth_name());
      System.out.println("booth_category: " + booth.getBooth_category());
      System.out.println("sellr_id: " + booth.getSeller_id());
    }
    model.addAttribute("mybooths", mybooths);
  }

  @GetMapping("mypage_booth_add")
  public void getFestivals(Model model) {
    System.out.println("getFestivals test");
    List<FestivalVO> festivals = myboothService.ShowAllfstv();
    model.addAttribute("festivals", festivals);
    System.out.println("getFestivals test : " + festivals);
  }
  @PostMapping("deleteBooth")
  @ResponseBody
  public String deleteBooth(int boothNo) {
    System.out.println("deltebooth하기");
    try {
      // 부스 삭제 서비스 호출
      myboothService.deleteBooth(boothNo);
      return "Success";
    } catch (Exception e) {
      // 삭제 중 오류 발생 시 오류 메시지 반환
      return "Error: " + e.getMessage();
    }
  }
  @RequestMapping("mypage_booth_edit")
  public void showBoothEditPage(int boothNo, Model model) {
    BoothVO booth = myboothService.getBoothDetailsByNo(boothNo);
    List<BoothProductVO> products = myboothService.getboothproduct(boothNo);
    System.out.println("mypage_booth_edit success");
    System.out.println("booth : " + booth.getBooth_name());
    System.out.println("booth : " + booth.getBooth_no());
    System.out.println("products : " + products);
    model.addAttribute("products", products);
    model.addAttribute("booth", booth);
  }
  @PostMapping("updateBooth")
  @ResponseBody
  public String updateBooth(@RequestBody BoothVO boothVO) {
      myboothService.updateBooth(boothVO);
      System.out.println("success");
      return String.valueOf(boothVO.getBooth_no());
  }
  @PostMapping("deleteBoothProduct")
  @ResponseBody
  public String deleteBoothProduct(int boothNo) {
      try {
          // 부스 상품 삭제 서비스 호출
          myboothService.deleteBoothProduct(boothNo);
          System.out.println("delete");
          return "Success";
      } catch (Exception e) {
          // 삭제 중 오류 발생 시 오류 메시지 반환
          return "Error: " + e.getMessage();
      }
  }
  @PostMapping("updateBoothProduct")
  @ResponseBody
  public String insertBoothProduct(@RequestBody Map<String, Object> data) {
      String boothNoString = (String) data.get("boothNo");

      try {
          // boothNo를 Integer로 변환
          int boothNo = Integer.parseInt(boothNoString);

          List<BoothProductVO> items = (List<BoothProductVO>) data.get("items");
          System.out.println("updateBoothProduct success");

          // 부스 상품 추가 서비스 호출
          myboothService.insertBoothProduct(boothNo, items);
          System.out.println("updateBoothProduct success : " + boothNo);
          System.out.println("updateBoothProduct success : " + items);
          return "Success";
      } catch (NumberFormatException e) {
          // boothNo를 Integer로 변환할 때 오류 발생 시 처리
          return "Error: Invalid boothNo format";
      } catch (Exception e) {
          // 추가 중 오류 발생 시 오류 메시지 반환
          return "Error: " + e.getMessage();
      }
  }

  @PostMapping("image.do")
  @ResponseBody
  public String handleFileUpload(@RequestParam("file") MultipartFile file) {
      try {
          // 이미지 업로드 서비스 호출
          String imageUrl = awsS3Biz.uploadAndSaveBoothImage(file);
          return imageUrl;
      } catch (Exception e) {
          e.printStackTrace();
          return "Error uploading image.";
      }
  }
}