package com.multi.FM.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService {
  
    @Autowired
    ManagerDAO dao;
    
    public List<ReportVO> report_list() throws Exception {
      return dao.report_list();
    }

    public List<ReportVO> report_search(String type, String word) throws Exception {
      return dao.report_search(type, word);
    }
    
    public ReportVO report_detail(ReportVO reportVO) {
      return dao.report_detail(reportVO);
    }
    
}
