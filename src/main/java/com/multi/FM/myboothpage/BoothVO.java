package com.multi.FM.myboothpage;

import java.util.List;
import com.multi.FM.booth.BoothProductVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoothVO {
  private int booth_no;
  private String booth_name;
  private String seller_id;
  private int fstv_no;
  private String booth_addr;
  private String booth_image;
  private String booth_tel;
  private String booth_hours;
  private String booth_category;
  private String booth_introduction;
  private String booth_ban;  
  //fstv table 조인
  private String fstv_title;
  private List<BoothProductVO> products;
  private int report_count;
  private String user_id;
}