package com.multi.FM.fstv;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@PropertySource("classpath:key.properties")
@Configuration
public class FestivalConfiguration {

  @Value("${fstv.key}")
  private String fstv_key;
  
  @Bean
  public String fstv_key() {
    return fstv_key;
  }
  
}
