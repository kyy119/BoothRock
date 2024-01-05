package com.multi.FM.fstv;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
// import java.nio.file.Files;
// import java.nio.file.Paths;
// import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.core.io.ClassPathResource;
// import org.springframework.http.converter.StringHttpMessageConverter;
// import org.springframework.web.client.RestTemplate;
import org.springframework.util.StreamUtils;

public class fstvGetApi {
	
	public ArrayList<FestivalVO> parse() {
		// url + parameter(인증키 etc...)
		//String url = "http://apis.data.go.kr/B551011/KorService1/areaBasedList1";
		//String paramter = "?numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&ServiceKey="
		//				  + APIKey.key4 + "&listYN=Y&arrange=D&contentTypeId=15&areaCode=&sigunguCode=&cat1=&cat2=&cat3=";
		// http 요청 >> 응답(xml)
		
		//RestTemplate restTemplate = new RestTemplate();
		//restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
		//String response = restTemplate.getForObject(url + paramter, String.class);
		
		// System.out.println(response);
		
		// xml >> json변경
		JSONObject json = null;
		JSONObject json2 = null;
		try {
            // XML 파일의 경로 (클래스 패스 내에 있는 경우)
            ClassPathResource resource = new ClassPathResource("fstvmain.xml");
            ClassPathResource resource2 = new ClassPathResource("info2.xml");

            // XML 파일을 문자열로 읽기
            String xmlString = StreamUtils.copyToString(resource.getInputStream(), StandardCharsets.UTF_8);
            String xmlString2 = StreamUtils.copyToString(resource2.getInputStream(), StandardCharsets.UTF_8);

            // XML 문자열을 JSON 객체로 변환
            json = XML.toJSONObject(xmlString);
            json2 = XML.toJSONObject(xmlString2);

        } catch (IOException e) {
            e.printStackTrace();
        }
		
		// json분석 후 데이터 추출 >> parser 클래스
		JSONObject response = json.getJSONObject("response");
		JSONObject response2 = json2.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject body2 = response2.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONObject items2 = body2.getJSONObject("items");
		// 값이 json일 때 getJSONObject로 가져옴 ( Array일경우 getJSONArray사용 )
		JSONArray arr = items.getJSONArray("item");
		JSONArray arr2 = items2.getJSONArray("item");
		
		StringBuilder sb = null;
		
		ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();
		for (int i = 0; i < arr.length(); i++) {
			FestivalVO vo = new FestivalVO();
			vo.setFstv_no(arr.getJSONObject(i).getInt("contentid"));
			vo.setFstv_title(arr.getJSONObject(i).getString("title"));
			vo.setFstv_image(arr.getJSONObject(i).getString("firstimage"));
			vo.setFstv_addr1(arr.getJSONObject(i).getString("addr1"));
			vo.setFstv_mapx(arr.getJSONObject(i).getDouble("mapx"));
			vo.setFstv_mapy(arr.getJSONObject(i).getDouble("mapy"));
			vo.setFstv_tel(arr.getJSONObject(i).getString("tel"));
			vo.setFstv_eventinfo(arr.getJSONObject(i).getString("infotext"));
			vo.setFstv_eventcont(arr.getJSONObject(i).getString("infocont"));
			
			sb = new StringBuilder(String.valueOf(arr2.getJSONObject(i).getInt("eventstartdate")));
			sb.insert(4, "-");
			sb.insert(7, "-");
			vo.setFstv_startdate(Date.valueOf(sb.toString()));
			
			sb = new StringBuilder(String.valueOf(arr2.getJSONObject(i).getInt("eventenddate")));
			sb.insert(4, "-");
			sb.insert(7, "-");
			vo.setFstv_enddate(Date.valueOf(sb.toString()));
			
			vo.setFstv_usetimefestival(arr2.getJSONObject(i).getString("usetimefestival"));
			vo.setFstv_eventplace(arr2.getJSONObject(i).getString("eventplace"));
			vo.setFstv_playtime(arr2.getJSONObject(i).getString("playtime"));
			vo.setFstv_homepage(arr2.getJSONObject(i).getString("homepage"));
			// getinfoapi(vo);
			// getinfoapi method를 만들어서 contentid에 맞는 open api 데이터를 받으려 했지만
			// 과도한 연결 요청으로 인해 app key가 denied 되어버림 >> xml파일을 수정하여 한꺼번에 받는 작업으로 변경
			
			//vo.setEventInfo(arr.getJSONObject(i).getString("infotext"));
			//vo.setEventCont(arr.getJSONObject(i).getString("infocont"));
			list.add(vo);
		}
		
		return list;
	}
	
	/*
	 * public FestivalVO getinfoapi(FestivalVO vo) { //String url =
	 * "http://apis.data.go.kr/B551011/KorService1/detailInfo1"; //String paramter =
	 * "?numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&ServiceKey=" // +
	 * APIKey.key4 + "&contentTypeId=15&contentId=" + vo.getContentid() // +
	 * "&MobileOS=ETC&MobileApp=AppTest"; // 축제API중 contentid를 통해 세부사항 가져오는 API 추가사용
	 * 
	 * //RestTemplate rtdetail = new RestTemplate();
	 * //rtdetail.getMessageConverters().add(0, new
	 * StringHttpMessageConverter(StandardCharsets.UTF_8)); // RestTemplate 사용 및 한글
	 * 깨짐 방지용 코드
	 * 
	 * //String rsp = rtdetail.getForObject(url + paramter, String.class); // API 호출
	 * 후 데이터를 response에 저장 JSONObject json2 = null; try { // XML 파일의 경로 (클래스 패스 내에
	 * 있는 경우) ClassPathResource resource = new ClassPathResource("info.xml");
	 * 
	 * // XML 파일을 문자열로 읽기 String xmlString =
	 * StreamUtils.copyToString(resource.getInputStream(), StandardCharsets.UTF_8);
	 * 
	 * // XML 문자열을 JSON 객체로 변환 json2 = XML.toJSONObject(xmlString);
	 * 
	 * // JSON 객체 사용 System.out.println(json2.toString()); } catch (IOException e) {
	 * e.printStackTrace(); }
	 * 
	 * JSONObject rsp2 = json2.getJSONObject("response"); JSONObject body2 =
	 * rsp2.getJSONObject("body"); JSONObject items2 = body2.getJSONObject("items");
	 * JSONArray arr2 = items2.getJSONArray("item"); for (int j = 0; j <
	 * arr2.length(); j++) { int cntid = arr2.getJSONObject(j).getInt("contentid");
	 * if(vo.getContentid() == cntid) {
	 * vo.setEventInfo(arr2.getJSONObject(j).getString("infotext"));
	 * vo.setEventCont(arr2.getJSONObject(j).getString("infocont")); } } // 호출한 데이터를
	 * JSON으로 변환하고 뽑아오기 위해 객체 생성
	 * 
	 * return vo;
	 * 
	 * }
	 */
}