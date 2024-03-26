package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import com.itbank.model.MessageDTO;

@Controller
public class StompController {

	@MessageMapping("/create")	//client요청
	@SendTo("/broker/message")	//server에서 broker가 해당 채널로 뿌려줌 
	public MessageDTO enter(MessageDTO message) {
		if(message != null) {message.setText(message.getFrom() + "님이 접속하였습니다");}
		System.out.println(message.getFrom() + "님이 접속하였습니다");
		return message;
	}
	
		
	@MessageMapping("/openChat/{userid}")
	@SendTo("/broker/cons/admin")
	public MessageDTO message(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/sendM/{userid}")
	@SendTo("/broker/goChat/{userid}")
	public MessageDTO chat(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/alarm/{userid}")
	@SendTo("/broker/message/{userid}")
	public String chat(String from) {
		if(from == "") {
			
			from = "관리자";
		}
		return from;
	}
	
//	@MessageMapping("/sendM/{userid}/{sendTo}")
//	@SendTo("/broker/message?userid={sendTo}")
//	public MessageDTO message(MessageDTO message) {
//		return message;
//	}
	
//	@MessageMapping("/disconnect/{roomId}")
//	@SendTo("/broker/room/{roomId}")
//	public MessageDTO disconnect(MessageDTO message) {
//		message.setText(message.getFrom() + "님이 채팅방을 나갔습니다");
//		message.setFrom("service");
//		return message;
//	}

	// 로그인 시 -> header 구독 or userid로 채널 구독
	// 요청 들어왔을 시 -> header에 전체 공지 or userid에 해당하는 채널에 알림 도 가능(?)

}
