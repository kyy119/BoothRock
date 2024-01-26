package com.multi.FM.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:key.properties")
public class ApiKey {
    
    @Autowired
    ApplicationContext ctx;
    
    public String key() {
        Environment env = ctx.getEnvironment();
        String key = env.getProperty("ocr.secretKey");
        System.out.println(key);
        return key;
    }
}