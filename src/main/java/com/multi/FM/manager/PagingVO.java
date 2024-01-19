package com.multi.FM.manager;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class PagingVO {
    private int start;
    private int end;
    private int page = 1;
    private int count;
    private String type;
    private String keyword;
    private String table;
  
    public void setStartEnd() {
      start = 1 + (page - 1) * 10;
      end = page * 10;
    }
    
    public int getPages(int count) {
      int pages = count / 10;
      if (count % 10 != 0) {
          pages = (count / 10) + 1;
      }
      return pages;
  }

}