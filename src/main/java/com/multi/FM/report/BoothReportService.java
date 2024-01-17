package com.multi.FM.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.multi.FM.myboothpage.BoothVO;

@Service
public class BoothReportService {

    @Autowired
    private BoothReportDAO dao;

    public boolean checkDuplicateReport(String user_id, int booth_no) {
        // 신고 이력 조회
      BoothReportVO ReportHistory = dao.ReportHistory(user_id, booth_no);
        return ReportHistory != null;
    }

    @Transactional
    public void insertReport(String report_title, String report_comment, 
                            int booth_no,String user_id) {
      dao.insertReport(report_title, report_comment, booth_no, user_id); 
    }

    public BoothReportVO boothDetailReport(int booth_no) {
      return dao.boothDetailReport(booth_no);
    }
}

