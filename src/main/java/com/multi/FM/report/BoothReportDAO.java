package com.multi.FM.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.multi.FM.myboothpage.BoothVO;

@Repository
public class BoothReportDAO {
  
  @Autowired
  SqlSessionTemplate my;

  public BoothReportVO ReportHistory(String user_id, int booth_no) {
    Map<String, Object> param = new HashMap<>();
    param.put("user_id", user_id);
    param.put("booth_no", booth_no);
    
    return my.selectOne("booth.ReportHistory", param);
  }
  
  @Transactional
  public void insertReport(String report_title, String report_comment, 
      int booth_no,String user_id) {
    BoothReportVO report = new BoothReportVO();
    report.setReport_title(report_title);
    report.setReport_comment(report_comment);
    report.setBooth_no(booth_no);
    report.setUser_id(user_id);

    my.insert("booth.insertReport", report);
    
  }

  public BoothReportVO boothDetailReport(int booth_no) {
    return my.selectOne("booth.reportBooth", booth_no);
  }

}
