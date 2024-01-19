package com.multi.FM.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService {
  
    @Autowired
    ManagerDAO dao;
    
    public List<ReportVO> report_list(PagingVO pagingVO) throws Exception {
      return dao.report_list(pagingVO);
    }

    public List<ReportVO> report_search(PagingVO pagingVO) throws Exception {
      return dao.report_search(pagingVO);
    }
    
    public ReportVO report_detail(ReportVO reportVO) {
      return dao.report_detail(reportVO);
    }

    public List<AskVO> ask_list(PagingVO pagingVO) {
      return dao.ask_list(pagingVO);
    }

    public AskVO ask_detail(AskVO askVO) {
      return dao.ask_detail(askVO);
    }

    public List<AskVO> ask_search(String type, String word) {
      return dao.ask_search(type, word);
    }
    
    public int total_count() {
      return dao.total_count();
    }
    
    public int report_count(PagingVO pagingVO) {
      return dao.report_count(pagingVO);
    }
    
}
