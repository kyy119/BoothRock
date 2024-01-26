package com.multi.FM.fstv;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FestivalPageVO {
  private int index;
  private int page;
  private String date1;
  private String date2;

  public void calidx() {
    index = (page - 1) * 9;
  }

  @Override
  public String toString() {
    return "FestivalPageVO [index=" + index + ", page=" + page + ", date1=" + date1 + ", date2="
        + date2 + "]";
  }

}
