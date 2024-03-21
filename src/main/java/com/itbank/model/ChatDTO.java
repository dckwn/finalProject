package com.itbank.model;

public class ChatDTO {
	private int idx;
	private String who_chat;
	private String who_send;
	private String content;
	private int isRead;
	
	
	
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWho_chat() {
		return who_chat;
	}
	public void setWho_chat(String who_chat) {
		this.who_chat = who_chat;
	}
	public String getWho_send() {
		return who_send;
	}
	public void setWho_send(String who_send) {
		this.who_send = who_send;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
