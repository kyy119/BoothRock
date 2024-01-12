package com.multi.FM.fstv;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class FestivalBoothVO {
  
  private int booth_no;
  private String booth_name;
  private double booth_starpoint;
  private String booth_category;
  private String booth_image;

}
