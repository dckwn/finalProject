package com.itbank.model;

public class TicketDTO {

//	IDX        NOT NULL NUMBER        
//	TK_VALUE            NUMBER        
//	TK_CONTENT NOT NULL VARCHAR2(500) 
//	PRICE      NOT NULL NUMBER
	
	private int idx;
	private int tk_value;
	private String tk_content;
	private int tk_day;
	private int price;
	
	public int getTk_day() {
		return tk_day;
	}
	public void setTk_day(int tk_day) {
		this.tk_day = tk_day;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTk_value() {
		return tk_value;
	}
	public void setTk_value(int tk_value) {
		this.tk_value = tk_value;
	}
	public String getTk_content() {
		return tk_content;
	}
	public void setTk_content(String tk_content) {
		this.tk_content = tk_content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
