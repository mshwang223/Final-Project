package com.spring_boot.FinalProject.service;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


@Service
public class GEOService {
	
	public String geoAddress(String address) {
		String clientId = "9ca3sk0yzl";  //clientId 
		String clientSecret = "CEMWynYITf1iInvwxOYRymEWHYFIQ0EnyOFQJWF6";  //clientSecret 
		
		String result = "";
		         
		try {
			String addr = URLEncoder.encode(address, "UTF-8");  //주소입력
		    String apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr; //json
		    //String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr; // xml
		    
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
		    con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
		            
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) { 
		    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  
		    	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    
		    String inputLine;
		    StringBuffer response = new StringBuffer();
		    
		    while ((inputLine = br.readLine()) != null) {
		    	response.append(inputLine);
		    }
		    
		    br.close();
		    
		    System.out.println(response.toString());
		    result = jsonToString(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	// JSON 파싱 메소드
	public String jsonToString(String jsonResultStr){
		String result = "";
		
		// JSON  형태의 문자열에서 JSON 오브젝트 "images" 추출해서 JSONArray에 저장
		JSONArray jsonObj = new JSONObject(jsonResultStr).getJSONArray("addresses");
		
		String x = jsonObj.getJSONObject(0).getString("x");
		String y = jsonObj.getJSONObject(0).getString("y");
		
		result = x + "," + y;
		System.out.println(result);
		return result;
	}
}
