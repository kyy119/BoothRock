package com.multi.FM.booth;

import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceiptVO {

  private String user_id;
  private String selling_number;
  private String transaction_date;
  private List<String> ocrResultList;
  
  public List<String> getOcrResultList() {
    return ocrResultList;
}

public void setOcrResultList(List<String> ocrResultList) {
    this.ocrResultList = ocrResultList;
}
}
