package com.multi.FM.users;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@PropertySource("classpath:db.properties")
@Configuration
@EnableWebMvc
public class UsersConfiguration {
  @Value("${sms.key}")
  private String sms_key;
  
  @Value("${sms.secretKey}")
  private String sms_secret_key;  
  
  @Value("${business.urlKey}")
  private String business_url_key;
  
  @Bean
  public String sms_key() {
    return sms_key;
  }
  
  @Bean
  public String sms_secret_key() {
    return sms_secret_key;
  }
  
  @Bean
  public String business_url_key() {
    return business_url_key;
  }
}
