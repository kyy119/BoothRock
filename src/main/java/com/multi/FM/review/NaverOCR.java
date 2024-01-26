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



//@Configuration
@Component
public class NaverOCR {

  private String ocr_url="https://yf0txwt9ox.apigw.ntruss.com/custom/v1/27980/1774bc610515286c013a601e02950e81873bb242ff30d10b4ae293236f4fd153/infer";
  
    private static final String FIELD_NAME_BUSINESS_NUMBER = "사업자번호";
    private static final String FIELD_NAME_TRANSACTION_DATE = "거래일시";
    
    public ReceiptVO ocr(byte[] fileBytes, String user_id, String key) {
        ReceiptVO receiptVO = new ReceiptVO(); // ReceiptVO 인스턴스 생성
        
      

        try {
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

            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            // File 객체 대신 바이트 배열을 전달
            writeMultiPart(wr, postParams, fileBytes, boundary);
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            System.out.println(response);
            // String을 json으로 만들어서 inferText만 추출해봅시다.
            JSONObject json2 = new JSONObject(response.toString());
            System.out.println(json2);
            JSONArray images_arr = json2.getJSONArray("images");
            JSONObject images_0 = images_arr.getJSONObject(0);
            JSONArray fields_arr = images_0.getJSONArray("fields");
            
            for (int i = 0; i < fields_arr.length(); i++) {
              JSONObject inferText = fields_arr.getJSONObject(i);
              String fieldName = inferText.getString("name");
              String text = inferText.getString("inferText");

              // 필드 이름이 "사업자번호"인 경우
              if (FIELD_NAME_BUSINESS_NUMBER.equals(fieldName)) {
                System.out.println(text);
                receiptVO.setSelling_number(text);
                System.out.println(text);
            }
            // 필드 이름이 "거래일시"인 경우
            else if (FIELD_NAME_TRANSACTION_DATE.equals(fieldName)) {
              System.out.println(text);
                receiptVO.setTransaction_date(text);
                
            }

            // OCR에서 추출한 텍스트를 필요한 경우 사용할 수 있도록 리스트에 추가 (선택 사항)
            // list.add(text);
        }

        // ReceiptVO에 결과 저장
        receiptVO.setUser_id(user_id);

    } catch (Exception e) {
        System.out.println(e);
    }

    return receiptVO;
}

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
            fileString.append("\"demo.png\"\r\n"); // Adjust the filename as needed
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            // Write the file bytes
            out.write(fileBytes);
            out.write("\r\n".getBytes());
            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }
}
