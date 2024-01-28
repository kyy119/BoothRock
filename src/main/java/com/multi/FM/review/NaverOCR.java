package com.multi.FM.review;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;



@Component
public class NaverOCR {

  // Naver OCR API 엔드포인트 URL
  private String ocr_url = "https://yf0txwt9ox.apigw.ntruss.com/custom/v1/27980/1774bc610515286c013a601e02950e81873bb242ff30d10b4ae293236f4fd153/infer";
  
  // OCR 결과에서 추출할 필드명 상수
  private static final String FIELD_NAME_BUSINESS_NUMBER = "사업자번호";
  private static final String FIELD_NAME_TRANSACTION_DATE = "거래일시";
    
  // OCR 수행 메서드
  public ReceiptVO ocr(byte[] fileBytes, String user_id, String key) {
    ReceiptVO receiptVO = new ReceiptVO(); // ReceiptVO 인스턴스 생성 
    try {
      // OCR API 호출을 위한 연결 설정
      URL url = new URL(ocr_url);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setUseCaches(false);
      con.setDoInput(true);
      con.setDoOutput(true);
      con.setReadTimeout(30000);
      con.setRequestMethod("POST");
      String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
      con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
      con.setRequestProperty("X-OCR-SECRET", key);

      // OCR API에 전송할 JSON 메시지 생성
      JSONObject json = new JSONObject();
      json.put("version", "V2");
      json.put("requestId", UUID.randomUUID().toString());
      json.put("timestamp", System.currentTimeMillis());
      JSONObject image = new JSONObject();
      image.put("format", "png"); // jpg
      image.put("name", "demo");
      JSONArray images = new JSONArray();
      images.put(image);
      json.put("images", images);
      String postParams = json.toString();

      // OCR API 호출
      con.connect();
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      writeMultiPart(wr, postParams, fileBytes, boundary);
      wr.close();

      // OCR API 응답 처리
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) {
        br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
      } else {
        br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
      }
      String inputLine;
      StringBuffer response = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
      }
      br.close();

      System.out.println(response);

      // OCR 결과를 JSON으로 파싱
      JSONObject json2 = new JSONObject(response.toString());
      System.out.println(json2);
      JSONArray images_arr = json2.getJSONArray("images");
      JSONObject images_0 = images_arr.getJSONObject(0);
      JSONArray fields_arr = images_0.getJSONArray("fields");

      // 추출된 필드를 ReceiptVO에 저장
      for (int i = 0; i < fields_arr.length(); i++) {
        JSONObject inferText = fields_arr.getJSONObject(i);
        String fieldName = inferText.getString("name");
        String text = inferText.getString("inferText");

        // 필드 이름이 "사업자번호"인 경우
        if (FIELD_NAME_BUSINESS_NUMBER.equals(fieldName)) {
          // "-"를 제외한 텍스트 저장
          String cleanedText = text.replace("-", "");
          System.out.println(cleanedText);
          receiptVO.setSelling_number(cleanedText);
        }
        // 필드 이름이 "거래일시"인 경우
        else if (FIELD_NAME_TRANSACTION_DATE.equals(fieldName)) {
          System.out.println(text);
          receiptVO.setTransaction_date(text);
        }
      }

      // ReceiptVO에 결과 저장
      receiptVO.setUser_id(user_id);

    } catch (Exception e) {
      System.out.println(e);
    }

    return receiptVO;
  }

  // 멀티파트 형식으로 데이터 전송하는 메서드
  private static void writeMultiPart(OutputStream out, String jsonMessage, byte[] fileBytes, String boundary) throws IOException {
    StringBuilder sb = new StringBuilder();
    sb.append("--").append(boundary).append("\r\n");
    sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
    sb.append(jsonMessage);
    sb.append("\r\n");

    out.write(sb.toString().getBytes("UTF-8"));
    out.flush();

    if (fileBytes != null && fileBytes.length > 0) {
      out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
      StringBuilder fileString = new StringBuilder();
      fileString
          .append("Content-Disposition:form-data; name=\"file\"; filename=");
      fileString.append("\"demo.png\"\r\n"); // 파일 이름
      fileString.append("Content-Type: application/octet-stream\r\n\r\n");
      out.write(fileString.toString().getBytes("UTF-8"));
      out.flush();

      // 파일 바이트 쓰기
      out.write(fileBytes);
      out.write("\r\n".getBytes());
      out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
    }
    out.flush();
  }
}
