package com.multi.FM.myboothpage;

import java.io.IOException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AwsS3Biz {
  @Autowired
  private AmazonS3 s3Client;

  @Value("${bucketName}")
  private String bucketName;

  public String uploadAndSaveBoothImage(MultipartFile multipartFile) throws IOException {
    String filePath = generateStoredFileName();  // 이미지 경로 수정 (원하는 경로로 변경 가능)
    s3Client.putObject(new PutObjectRequest(bucketName, filePath, multipartFile.getInputStream(), null));
    return s3Client.getUrl(bucketName, filePath).toString();
  }
  private String generateStoredFileName() {
    return UUID.randomUUID().toString();
  }
}
