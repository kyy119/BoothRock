package com.multi.FM.myboothpage;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.beans.factory.annotation.Value;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@PropertySource("classpath:db.properties")
@Configuration
@EnableWebMvc
public class AWSConfiguration {
    
//    @Value("${SECRET_KEY}")
//    private String accessKey;

    private String accessKey = "AKIA4WBDLGZIT6DZFFE6";
 //   @Value("${ACCESS_KEY}")
    private String secretKey = "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";
    
    @Value("${bucketName}")
    private String bucketName;  // 추가: S3 버킷 이름을 가져오기 위한 프로퍼티

    @Bean
    public BasicAWSCredentials AwsCredentials() {
        BasicAWSCredentials AwsCreds = new BasicAWSCredentials(accessKey, secretKey);
        return AwsCreds;
    }

    @Bean
    public AmazonS3 AwsS3Client() {
        AmazonS3 s3Builder = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.AP_NORTHEAST_2)
                .withCredentials(new AWSStaticCredentialsProvider(this.AwsCredentials()))
                .build();

        return s3Builder;
    }
    
    @Bean(name = "bucketName")  // 추가: 버킷 이름을 Bean으로 등록
    public String getBucketName() {
        return bucketName;
    }
}
