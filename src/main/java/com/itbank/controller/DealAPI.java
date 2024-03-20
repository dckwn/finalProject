package com.itbank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class DealAPI {
    
    private String impKey = "2280837412513171";
    private String impSecret = "ddmGsHspLyvH7B7v0h4bxzNyZ34botm42eBzVR6sB6DobDILf64s974a41nq2YQuqI77RytSXVkHJm2H";

    @PostMapping("/cancelPayment")
    public ResponseEntity<String> cancelPayment() {
        String access_token = getToken(); // 액세스 토큰을 가져옴
        
        if (access_token != null) {
            return executeCancelPayment(access_token);
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

    private ResponseEntity<String> executeCancelPayment(String access_token) {
    	String url = "https://api.iamport.kr/payments/cancel";
        
    	HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(access_token); // Authorization 헤더에 access token 추가
        headers.add("Content-Type", "application/json"); // Content-Type 헤더를 application/json으로 설정
        
        Map<String, Object> requestData = new HashMap<>();
        requestData.put("merchant_uid", "merchant_1234");
        requestData.put("amount", 500);
        
        HttpEntity<Map<String, Object>> httpEntity = new HttpEntity<>(requestData, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, httpEntity, String.class);
        
        return response;
    }
    
    
    
    
}
