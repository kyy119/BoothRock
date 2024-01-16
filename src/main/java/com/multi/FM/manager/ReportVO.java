package com.multi.FM.manager;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class ReportVO {
	private int report_no;
	private int booth_no;
	private String user_id;
	private String comment;
	private String role;
	private String booth_name;
	private String report_date;
	private String report_title;
	
  @Override
  public String toString() {
    return "ReportVO [report_no=" + report_no + ", booth_no=" + booth_no + ", user_id=" + user_id
        + ", comment=" + comment + ", role=" + role + ", booth_name=" + booth_name
        + ", report_date=" + report_date + ", report_title=" + report_title + "]";
  }
	
}
