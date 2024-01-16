package com.multi.FM.booth;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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

  
  
  @Override
  public String toString() {
    return "BoothReviewVO [review_no=" + review_no + ", booth_no=" + booth_no
        + ", review_starpoint=" + review_starpoint + ", user_id=" + user_id + ", keyword1="
        + keyword1 + ", keyword2=" + keyword2 + ", keyword3=" + keyword3 + ", review_created_at="
        + review_created_at + ", booth_name=" + booth_name + ", fstv_title=" + fstv_title
        + ", booth_category=" + booth_category + "]";
  }
  

}
