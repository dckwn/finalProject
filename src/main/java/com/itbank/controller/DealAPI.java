package com.itbank.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.itbank.model.ChatDTO;
import com.itbank.model.DealDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.DealService;


@RestController
public class DealAPI {

	@Autowired private DealService ds;
    private String impKey = "2280837412513171";
    private String impSecret = "ddmGsHspLyvH7B7v0h4bxzNyZ34botm42eBzVR6sB6DobDILf64s974a41nq2YQuqI77RytSXVkHJm2H";
    
    @PostMapping("/cancelPayment")
    public ResponseEntity<String> cancelPayment(@RequestBody Map<String, String> requestBody) {
        String access_token = getToken(); // 액세스 토큰을 가져옴
        String imp_uid = requestBody.get("imp_uid");
        if (access_token != null) {
            return executeCancelPayment(access_token, imp_uid);
        } else {
            // 액세스 토큰을 가져오지 못한 경우에 대한 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to get access token");
        }
    }

    private String getToken() {
        String url = "https://api.iamport.kr/users/getToken";
        
        // IAMPORT API에 전달할 데이터
        Map<String, String> requestData = new HashMap<>();
        requestData.put("imp_key", impKey);
        requestData.put("imp_secret", impSecret);
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, requestData, String.class);
        
        // IAMPORT API로부터의 응답 반환
        if (response.getStatusCode().is2xxSuccessful()) {
        	String responseBody = response.getBody();

        	String accessToken = null;
        	if (responseBody != null) {
        	    String[] parts = responseBody.split("\"access_token\"\\s*:\\s*\"");
        	    if (parts.length > 1) {
        	        String[] subParts = parts[1].split("\"", 2);
        	        if (subParts.length > 0) {
        	            accessToken = subParts[0];
        	        }
        	    }
        	}
            return accessToken;
        } else {
            // 응답이 실패한 경우에는 null을 반환
            return null;
        }
    }

    private ResponseEntity<String> executeCancelPayment(String access_token, String imp_uid) {
    	String url = "https://api.iamport.kr/payments/cancel";
        
    	ds.cancelDeal(imp_uid);
    	
    	HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(access_token); // Authorization 헤더에 access token 추가
        headers.add("Content-Type", "application/json"); // Content-Type 헤더를 application/json으로 설정
        
        Map<String, Object> requestData = new HashMap<>();
        requestData.put("imp_uid", imp_uid);
        requestData.put("amount", 0);
        
        HttpEntity<Map<String, Object>> httpEntity = new HttpEntity<>(requestData, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, httpEntity, String.class);
        
        System.out.println(response);
        
        return response;
    }
    
    
    
    
}
