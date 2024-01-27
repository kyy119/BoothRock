package com.multi.FM.manager;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data

public class AskVO {
  private int ask_no;
  private String user_id;
  private String ask_title;
  private String ask_content;
  private String ask_type;
  private String ask_answer;
  private String ask_created_at;
  private String word;
  private String type;
}
