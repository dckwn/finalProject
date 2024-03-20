package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ChatDTO;
import com.itbank.service.ChatService;

@RestController
public class ChatAPI {
	
	@Autowired private ChatService cs;
	
	@GetMapping("/loadChat")
	public List<String> loadChat(){
		return cs.loadChat();
	}
	
	@GetMapping("/outChat/{who_chat}")
	public int outChat(@PathVariable("who_chat") String who_chat){
		return cs.outChat(who_chat);
	}
	
	@GetMapping("/getChat/{who_chat}")
	public List<ChatDTO> getChat(@PathVariable("who_chat") String who_chat){
		return cs.getChat(who_chat);
	}
	
	@PostMapping("/saveChat")
	public int saveChat(@RequestBody ChatDTO dto) {
		int row = cs.saveChat(dto);
		return row;
	}
	
}
