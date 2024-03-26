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
	private String imp_uid;
	
	private int buyCount;   // 구매한 티켓 수
	private int tkCount;	//
	private int tk_value;
	private int ticket_1;
	private int ticket_2;
	private int ticket_3;
	
	
	public int getTicket_1() {
		return ticket_1;
	}
	public void setTicket_1(int ticket_1) {
		this.ticket_1 = ticket_1;
	}
	public int getTicket_2() {
		return ticket_2;
	}
	public void setTicket_2(int ticket_2) {
		this.ticket_2 = ticket_2;
	}
	public int getTicket_3() {
		return ticket_3;
	}
	public void setTicket_3(int ticket_3) {
		this.ticket_3 = ticket_3;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
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
