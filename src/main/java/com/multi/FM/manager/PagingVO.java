package com.multi.FM.manager;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class PagingVO {
    private int offset;
    private int page = 1;
    private int count;
    private String type;
    private String keyword;
    private String role;
    private String table;
    private String user_role;
  
    public void Offset() {
      offset = (page - 1) * 10;
    }
    
    public int getPages(int count) {
      int pages = count / 10;
      if (count % 10 != 0) {
          pages = (count / 10) + 1;
      }
      return pages;
  }

}