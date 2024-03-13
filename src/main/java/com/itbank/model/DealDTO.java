package com.itbank.model;

import java.sql.Date;

public class DealDTO {

//	IDX       NOT NULL NUMBER        
//	USERID    NOT NULL VARCHAR2(150) 
//	TICKET_ID NOT NULL NUMBER        
//	BUYCOUNT  NOT NULL NUMBER        
//	BUYDAY             DATE          
//	EXPIRDAY           DATE          
//	BUYPRICE  NOT NULL NUMBER 
	
	private int idx;
	private String userid;
	private int ticket_id;
	private Date buyDay;
	private Date expirDay;
	
	private int buyCount;   // 구매한 티켓 수
	private int tkCount;	//
	private int tk_value;
	
	
	public int getTk_value() {
		return tk_value;
	}
	public void setTk_value(int tk_value) {
		this.tk_value = tk_value;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	
	public int getTkCount() {
		return tkCount;
	}
	public void setTkCount(int tkCount) {
		this.tkCount = tkCount;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}
	
	public Date getBuyDay() {
		return buyDay;
	}
	public void setBuyDay(Date buyDay) {
		this.buyDay = buyDay;
	}
	public Date getExpirDay() {
		return expirDay;
	}
	public void setExpirDay(Date expirDay) {
		this.expirDay = expirDay;
	}
	
	
	
}
