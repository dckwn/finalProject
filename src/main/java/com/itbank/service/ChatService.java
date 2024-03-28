package com.itbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ChatDTO;
import com.itbank.repository.ChatDAO;

@Service
public class ChatService {

	@Autowired private ChatDAO dao;

	public int saveChat(ChatDTO dto) {
		return dao.insert(dto);
	}

	public List<ChatDTO> getChat(String who_chat) {
		return dao.select(who_chat);
	}

	public int outChat(String who_chat) {
		return dao.delete(who_chat);
	}

	public List<String> loadChat() {
		return dao.load();
	}

	public void read(Map<String, String> map) {
		dao.read(map);		
	}

	public String readCheck(Map<String, String> map) {
		
		return dao.readCheck(map);
	}
	
}
