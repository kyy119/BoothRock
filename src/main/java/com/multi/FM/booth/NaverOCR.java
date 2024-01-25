package com.multi.FM.booth;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@PropertySource("classpath:db.properties")
@Component
public class NaverOCR {
  
    private static final String FIELD_NAME_BUSINESS_NUMBER = "사업자번호";
    private static final String FIELD_NAME_TRANSACTION_DATE = "거래일시";
    private String ocrURL = "https://amyv5uss3u.apigw.ntruss.com/custom/v1/27825/7d324cb163ba72b3ba96aa233810eeaf820e999919e63c0ea48a787e1ff39094/infer";
    private String ocrSecretKey = "VHlXY2ZSR29VSFF0TXNib3dxcExnRk9ZUXNDaWhtZEc=";
    @Autowired
    private HttpServletRequest request;

    private static File createTempFile(InputStream inputStream, String prefix, String suffix) throws IOException {
        File tempFile = File.createTempFile(prefix, "." + suffix);
        Files.copy(inputStream, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        return tempFile;
    }

    public ReceiptVO ocr(byte[] fileBytes) {
        ArrayList<String> list = new ArrayList<>();
        System.out.println("ocrURL: " + ocrURL);
        System.out.println("ocrSecretKey: " + ocrSecretKey);
        JSONArray fields_arr = null;
        try {
            URL url = new URL(ocrURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setReadTimeout(30000);
            con.setRequestMethod("POST");
            String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-OCR-SECRET", ocrSecretKey);

            JSONObject json = new JSONObject();
            json.put("version", "V2");
            json.put("requestId", UUID.randomUUID().toString());
            json.put("timestamp", System.currentTimeMillis());
            JSONObject image = new JSONObject();
            image.put("format", "jpg");
            image.put("name", "demo");
            JSONArray images = new JSONArray();
            images.put(image);
            json.put("images", images);
            String postParams = json.toString();

            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            long start = System.currentTimeMillis();
            byte[] imageData = fileBytes;
            InputStream inputStream = new ByteArrayInputStream(imageData);
            File file = createTempFile(inputStream, "uploadedImage", "jpg");
            writeMultiPart(wr, postParams, file, boundary);
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            System.out.println(response);
            JSONObject json2 = new JSONObject(response.toString());
            System.out.println(json2);

            JSONArray images_arr = json2.optJSONArray("images");
            if (images_arr != null && images_arr.length() > 0) {
                JSONObject images_0 = images_arr.getJSONObject(0);

                // fields_arr를 여기서 초기화
                fields_arr = images_0.optJSONArray("fields");

                if (fields_arr != null) {
                    for (int i = 0; i < fields_arr.length(); i++) {
                        JSONObject inferText = fields_arr.getJSONObject(i);
                        String text = inferText.optString("inferText");
                        System.out.println(text);
                        list.add(text);
                    }
                } else {
                    System.out.println("Error: 'fields' array is null or empty.");
                }
            } else {
                System.out.println("Error: 'images' array is null or empty.");
            }

            ReceiptVO receiptVO = new ReceiptVO();
            String userId = getUserId();
            String extractedBusinessNumber = null;
            String extractedTransactionDate = null;
            receiptVO.setUser_id(userId);

            if (fields_arr != null) {
                for (int i = 0; i < fields_arr.length(); i++) {
                    JSONObject inferText = fields_arr.getJSONObject(i);
                    String text = inferText.optString("inferText");

                    switch (getFieldName(text)) {
                        case FIELD_NAME_BUSINESS_NUMBER:
                            extractedBusinessNumber = getFieldInferText(text);
                            break;
                        case FIELD_NAME_TRANSACTION_DATE:
                            extractedTransactionDate = getFieldInferText(text);
                            break;
                    }

                    System.out.println(extractedBusinessNumber + extractedTransactionDate + userId);
                    System.out.println(text);
                    list.add(text);
                }
            }

            System.out.println(extractedBusinessNumber + extractedTransactionDate + userId);
            receiptVO.setSelling_number(extractedBusinessNumber);
            receiptVO.setTransaction_date(extractedTransactionDate);

            // 추가: 추출된 텍스트 목록을 ReceiptVO에 설정
            receiptVO.setOcrResultList(list);

            return receiptVO;

        } catch (Exception e) {
          handleOcrError(e);
          return null;
          }
    }


    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        if (file != null && file.isFile()) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
            fileString.append("\"" + file.getName() + "\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
                out.write("\r\n".getBytes());
            }

            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }

    private String getFieldName(String item) {
        JSONObject fieldObject = new JSONObject(item);
        return fieldObject.optString("name", "");
    }

    private String getFieldInferText(String item) {
        JSONObject fieldObject = new JSONObject(item);
        return fieldObject.optString("inferText", "");
    }


private String getUserId() {
  String userId = (String) request.getSession().getAttribute("userId");
  if (userId == null || userId.isEmpty()) {
      // 예외 처리 또는 기본값 설정
      userId = "defaultUserId";
  }
  return userId;
}

private void handleOcrError(Exception e) {
  System.out.println("OCR 처리 중 오류 발생: " + e.getMessage());
  e.printStackTrace();
  // 추가적인 예외 처리 또는 로그 처리를 여기에 추가
}
}
