package com.multi.FM.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.FM.users.UsersVO;

@Service
public class ManagerService {
  
    @Autowired
    ManagerDAO dao;

    public List<UsersVO> user_list(PagingVO pagingVO) {
      return dao.user_list(pagingVO);
    }
    
    public List<UsersVO> user_search(PagingVO pagingVO) {
      return dao.user_search(pagingVO);
    }
    
    public List<UsersVO> ban_user_list(PagingVO pagingVO) {
      return dao.ban_user_list(pagingVO);
    }
    
    public List<UsersVO> ban_user_search(PagingVO pagingVO) {
      return dao.ban_user_search(pagingVO);
    }
    
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

}
