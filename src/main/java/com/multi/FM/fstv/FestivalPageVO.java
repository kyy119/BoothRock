package com.multi.FM.fstv;

public class FestivalPageVO {
  private int index;
  private int page;
  private String date1;
  private String date2;

  public void calidx() {
    index = (page - 1) * 9;
  }

  public int getIndex() {
    return index;
  }

  public void setIndex(int index) {
    this.index = index;
  }

  public int getPage() {
    return page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public String getDate1() {
    return date1;
  }

  public void setDate1(String date1) {
    this.date1 = date1;
  }

  public String getDate2() {
    return date2;
  }

  public void setDate2(String date2) {
    this.date2 = date2;
  }

  @Override
  public String toString() {
    return "FestivalPageVO [index=" + index + ", page=" + page + ", date1=" + date1 + ", date2="
        + date2 + "]";
  }

}
