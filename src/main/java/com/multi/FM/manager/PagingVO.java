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
    private String type;
    private String keyword;
  
    public void setStartEnd() {
      start = 1 + (page - 1) * 10;
      end = page * 10;
    }

}
