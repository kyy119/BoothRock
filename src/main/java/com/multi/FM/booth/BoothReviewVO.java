package com.multi.FM.booth;

public class BoothReviewVO {

  private int review_no;
  private int booth_no;
  private int review_starpoint;
  private String user_id;
  private String keyword1;
  private String keyword2;
  private String keyword3;
  private String review_created_at;
  private String booth_name;
  private String fstv_title;
  private String booth_category;
  
  
  public String getBooth_category() {
    return booth_category;
  }
  public void setBooth_category(String booth_category) {
    this.booth_category = booth_category;
  }
  public int getReview_no() {
    return review_no;
  }
  public void setReview_no(int review_no) {
    this.review_no = review_no;
  }
  public int getBooth_no() {
    return booth_no;
  }
  public void setBooth_no(int booth_no) {
    this.booth_no = booth_no;
  }
  public int getReview_starpoint() {
    return review_starpoint;
  }
  public void setReview_starpoint(int review_starpoint) {
    this.review_starpoint = review_starpoint;
  }
  public String getUser_id() {
    return user_id;
  }
  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }
  public String getKeyword1() {
    return keyword1;
  }
  public void setKeyword1(String keyword1) {
    this.keyword1 = keyword1;
  }
  public String getKeyword2() {
    return keyword2;
  }
  public void setKeyword2(String keyword2) {
    this.keyword2 = keyword2;
  }
  public String getKeyword3() {
    return keyword3;
  }
  public void setKeyword3(String keyword3) {
    this.keyword3 = keyword3;
  }
  public String getReview_created_at() {
    return review_created_at;
  }
  public void setReview_created_at(String review_created_at) {
    this.review_created_at = review_created_at;
  }
  public String getBooth_name() {
    return booth_name;
  }
  public void setBooth_name(String booth_name) {
    this.booth_name = booth_name;
  }
  public String getFstv_title() {
    return fstv_title;
  }
  public void setFstv_title(String fstv_title) {
    this.fstv_title = fstv_title;
  }
  @Override
  public String toString() {
    return "BoothReviewVO [review_no=" + review_no + ", booth_no=" + booth_no
        + ", review_starpoint=" + review_starpoint + ", user_id=" + user_id + ", keyword1="
        + keyword1 + ", keyword2=" + keyword2 + ", keyword3=" + keyword3 + ", review_created_at="
        + review_created_at + ", booth_name=" + booth_name + ", fstv_title=" + fstv_title
        + ", booth_category=" + booth_category + "]";
  }
  

}
