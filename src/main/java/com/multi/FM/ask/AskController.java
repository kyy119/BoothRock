package com.multi.FM.ask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.multi.FM.manager.AskVO;
import java.text.SimpleDateFormat;
import java.util.Date;
@Controller
public class AskController {
  
  @Autowired
  AskService askService;
  
  @PostMapping("insertAsk")
  @ResponseBody
  public String addAsk(@RequestBody AskVO askVO) {
    Date date = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    askVO.setAsk_created_at(ft.format(date));
    System.out.println(askVO);
    askService.insertAsk(askVO);
    return "success";
  }
}
