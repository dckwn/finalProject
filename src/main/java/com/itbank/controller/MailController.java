package com.itbank.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.MailComponent;

@RestController
@RequestMapping("/ajax")
public class MailController {

	private Random ran = new Random();
	@Autowired MailComponent mailComponent;
	
	@PostMapping("/sendMail")
	public int sendMail(@RequestBody HashMap<String, String> param, HttpSession session) {
		int num = ran.nextInt(999999);
		String authNumber = String.format("%06d", num);
		
		param.put("subject", "안녕하세요, health protector입니다");
		param.put("content", authNumber );
		session.setAttribute("authNumber", authNumber);
		session.setMaxInactiveInterval(180);
		int row = mailComponent.sendMimeMessage(param);
		
		
		return row;	
	}
	
	@GetMapping("/authNumber/{inputNumber}")
	public int authNumber(@PathVariable("inputNumber") String inputNumber, HttpSession session) {
		// 만약, 세션이 만료되었다면 (180초) authNumber의 값은 null 이다
		// 두개의 문자열의 일치를 비교할 때 A.equals(B) 형태로 비교한다
		// null일 가능성이 있는 문자열을 뒤에 배치해서 NullPointException을 방지한다
		
		// 만약, 세션이 만료되었을 때 예외를 발생시켜서 다른 반환값을 전달하려면, ExceptionHandler를 사용하거나
		// 혹은, @RestControllerAdive 클래스를 작성하여 처리할 수 도 있다
		String authNumber = (String) session.getAttribute("authNumber");
		int row = 0;
		if(inputNumber.equals(authNumber)) {
			row = 1;
		}
		return row;
	}
	
}
