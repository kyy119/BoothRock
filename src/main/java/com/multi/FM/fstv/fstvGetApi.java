package com.multi.FM.fstv;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

public class fstvGetApi {
  
  String key = "kr90lRK39YPQ8kZufNKeOnhj2uSxGiJSv%2BcIO3dLF3qKXeST425NvYJvS%2F6%2FhSVZpJTO17Sp636lg7FXrSUnOA%3D%3D&";

  public ArrayList<FestivalVO> parse() {
    String url = "http://apis.data.go.kr/B551011/KorService1/areaBasedList1";
    String parameter = "?numOfRows=2&pageNo=1&MobileOS=ETC&MobileApp=AppTest&ServiceKey=" + key
                     + "&listYN=Y&arrange=C&contentTypeId=15&areaCode=&sigunguCode=&cat1=&cat2=&cat3=";

    RestTemplate rt = new RestTemplate();
    // RestTemplate 사용 및 한글 깨짐 방지용 코드
    rt.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
    // API 호출 후 데이터를 response에저장
    String rsp = rt.getForObject(url + parameter, String.class);
    System.out.println(XML.toJSONObject(rsp));
    JSONArray arr = transfer_json(rsp).getJSONArray("item");

    ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();
    for (int i = 0; i < arr.length(); i++) {
      FestivalVO vo = new FestivalVO();
      vo.setFstv_no(arr.getJSONObject(i).getInt("contentid"));
      vo.setFstv_title(arr.getJSONObject(i).getString("title"));
      if (arr.getJSONObject(i).getString("firstimage") != "") {
        vo.setFstv_image(arr.getJSONObject(i).getString("firstimage"));
      } else {
        vo.setFstv_image("${pageContext.request.contextPath}/resources/img/no-image.jpg");
      }
      vo.setFstv_addr1(arr.getJSONObject(i).getString("addr1"));
      vo.setFstv_mapx(arr.getJSONObject(i).getDouble("mapx"));
      vo.setFstv_mapy(arr.getJSONObject(i).getDouble("mapy"));
      vo.setFstv_tel(arr.getJSONObject(i).getString("tel"));

      get_eventinfo_api(vo);
      get_fstvdate_api(vo);
      get_fstvsite_api(vo);

      list.add(vo);
      System.out.println(vo);
    }

    return list;
  }
  
  // eventinfo / eventcont 가져오기
  public FestivalVO get_eventinfo_api(FestivalVO vo) {
    
    String url = "http://apis.data.go.kr/B551011/KorService1/detailInfo1";
    String parameter = "?ServiceKey=" + key
                     + "contentTypeId=15&contentId="+ vo.getFstv_no() +"&MobileOS=ETC&MobileApp=AppTest";
    RestTemplate rt = new RestTemplate();
    rt.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));   // RestTemplate 사용 및 한글 깨짐 방지용 코드
    String rsp = rt.getForObject(url + parameter, String.class);                                // API 호출 후 데이터를 response에저장
    JSONArray arr = transfer_json(rsp).getJSONArray("item");

    int cnt = arr.length();
    if(cnt == 1) {
      vo.setFstv_eventinfo(arr.getJSONObject(0).getString("infotext"));
      vo.setFstv_eventcont("");
    } else if(cnt == 2) {
      vo.setFstv_eventinfo(arr.getJSONObject(0).getString("infotext"));
      vo.setFstv_eventcont(arr.getJSONObject(1).getString("infotext"));
    } else {
      vo.setFstv_eventinfo(arr.getJSONObject(0).getString("infotext"));
      vo.setFstv_eventcont(arr.getJSONObject(2).getString("infotext"));
    }
    return vo;
  }
  
  // 기간, 요금, 이용시간 가져오기
  public FestivalVO get_fstvdate_api(FestivalVO vo) {
    
    String url = "http://apis.data.go.kr/B551011/KorService1/detailIntro1";
    String paramter = "?ServiceKey=" + key
        + "&contentTypeId=15&contentId=" + vo.getFstv_no() + "&MobileOS=ETC&MobileApp=AppTest";
    
    RestTemplate rt = new RestTemplate();
    rt.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
    String rsp = rt.getForObject(url + paramter, String.class);
    JSONObject item = transfer_json(rsp).getJSONObject("item");
    
    StringBuilder sb = null;
    // fstv_startdate 와 fstv_enddate 입력
    sb = new StringBuilder(String.valueOf(item.getInt("eventstartdate")));
    sb.insert(4, "-");
    sb.insert(7, "-");
    vo.setFstv_startdate(Date.valueOf(sb.toString()));
    sb = new StringBuilder(String.valueOf(item.getInt("eventenddate")));
    sb.insert(4, "-");
    sb.insert(7, "-");
    vo.setFstv_enddate(Date.valueOf(sb.toString()));
    
    // fstv_usetimefestival / fstv_eventplace / fstv_playtime 입력
    vo.setFstv_usetimefestival(item.getString("usetimefestival"));
    vo.setFstv_eventplace(item.getString("eventplace"));
    vo.setFstv_playtime(item.getString("playtime"));
    
    return vo;
  }
  
  // 홈페이지 가져오기
  public FestivalVO get_fstvsite_api(FestivalVO vo) {
    
    String url = "http://apis.data.go.kr/B551011/KorService1/detailCommon1";
    String paramter = "?ServiceKey=" + key
        + "&contentTypeId=15&contentId=" + vo.getFstv_no()
        + "&MobileOS=ETC&MobileApp=AppTest&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
    
    RestTemplate rt = new RestTemplate();
    rt.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
    String rsp = rt.getForObject(url + paramter, String.class);
    JSONObject item = transfer_json(rsp).getJSONObject("item");
    
    vo.setFstv_homepage(item.getString("homepage").replaceAll("\\s{2,}", " "));
    
    return vo;
  }
  
  public JSONObject transfer_json(String rsp) {
    JSONObject json = XML.toJSONObject(rsp);
    JSONObject response = json.getJSONObject("response");
    JSONObject body = response.getJSONObject("body");
    return body.getJSONObject("items");
  }

}
