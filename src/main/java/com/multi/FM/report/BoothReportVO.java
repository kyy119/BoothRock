package com.multi.FM.report;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoothReportVO {
  
  private int report_no;
  private int booth_no;
  private String user_id;
  private String report_comment;
  private String report_title;
  private int fstv_no;
  private String report_date;
  private String booth_name;
  private String fstv_title;
}
